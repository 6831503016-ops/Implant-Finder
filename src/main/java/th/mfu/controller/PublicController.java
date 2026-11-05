package th.mfu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import th.mfu.repository.BrandRepository;
import th.mfu.repository.ImplantModelRepository;
import th.mfu.domain.ImplantModel;
import th.mfu.domain.ImplantSize;
import th.mfu.service.ImplantService;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;


@Controller
public class PublicController {

    /** จำนวนรุ่นแนะนำสูงสุดในหน้า model detail */
    private static final int MAX_SIMILAR = 4;

    @Autowired
    private BrandRepository brandRepo;

    @Autowired
    private ImplantModelRepository modelRepo;

    @Autowired
    private ImplantService implantService;


    @GetMapping("/")
    
    public String home(Model model) {
       model.addAttribute("brands", implantService.getBrandsWithPublicModels());
        return "public/home";
    }

    @GetMapping("/brand/{id}")
    public String brandModels(@PathVariable Long id, Model model) {
        model.addAttribute("brand", brandRepo.findById(id).orElse(null));
        model.addAttribute("models", modelRepo.findByBrandBrandId(id).stream()
               
                .toList());
        return "public/brand-models";
    }

    @GetMapping("/model/{id}")
    public String modelDetail(@PathVariable Long id,
                              @RequestParam(required = false) BigDecimal diameter,
                              @RequestParam(required = false) BigDecimal length,
                              @RequestParam(required = false) Long from,
                              @RequestParam(required = false) BigDecimal fromD,
                              @RequestParam(required = false) BigDecimal fromL,
                              Model model) {
        ImplantModel implant = modelRepo.findById(id).orElse(null);
        model.addAttribute("implant", implant);

        // มาจากการกดรุ่นแนะนำ → จำรุ่น/ขนาดก่อนหน้า เพื่อแสดงใน breadcrumb
        if (from != null && !from.equals(id)) {
            modelRepo.findById(from).ifPresent(prev -> {
                model.addAttribute("fromModel", prev);
                String link = "/model/" + prev.getModelId();
                if (fromD != null && fromL != null) {
                    link += "?diameter=" + plain(fromD) + "&length=" + plain(fromL);
                    model.addAttribute("fromSize", "Ø " + plain(fromD) + " × " + plain(fromL) + " mm");
                }
                model.addAttribute("fromLink", link);
            });
        }
        if (implant != null) {
            String visibleSizes = visibleSizes(implant).stream()
                    .map(ImplantSize::getDisplaySize)
                    .collect(Collectors.joining(", "));
            model.addAttribute("visibleSizes", visibleSizes);
            model.addAttribute("similar", findSimilar(implant, diameter, length));
        }
        return "public/model-detail";
    }

    /* =========================================================
       Recommend: หารุ่นของ "แบรนด์อื่น" ที่คล้ายกับรุ่นที่ดูอยู่
       ให้คะแนนจาก ขนาดเดียวกัน > ข้อต่อ (connection) > ชนิด (type)
       > วัสดุ > ผิว (surface) แล้วเลือกคะแนนสูงสุด 4 รุ่น
    ========================================================= */
    private List<SimilarImplant> findSimilar(ImplantModel current, BigDecimal diameter, BigDecimal length) {
        List<SimilarImplant> result = new ArrayList<>();

        for (ImplantModel other : modelRepo.findAll()) {
            if (other.getBrand() == null || current.getBrand() == null) continue;
            if (other.getBrand().getBrandId().equals(current.getBrand().getBrandId())) continue;
            if (!isPublic(other)) continue;

            List<ImplantSize> sizes = visibleSizes(other);
            int score = 0;
            List<String> tags = new ArrayList<>();
            String link = "/model/" + other.getModelId();

            // 1) ขนาด
            if (diameter != null && length != null) {
                ImplantSize exact = sizes.stream()
                        .filter(s -> same(s.getDiameterMm(), diameter) && same(s.getLengthMm(), length))
                        .findFirst().orElse(null);
                if (exact != null) {
                    score += 5;
                    tags.add("Same size");
                } else if (sizes.stream().anyMatch(s -> same(s.getDiameterMm(), diameter))) {
                    score += 3;
                    tags.add("Ø " + plain(diameter) + " mm available");
                } else if (sizes.stream().anyMatch(s -> s.getDiameterMm() != null
                        && s.getDiameterMm().subtract(diameter).abs().compareTo(new BigDecimal("0.3")) <= 0)) {
                    score += 1;
                    tags.add("Similar diameter");
                }
            }

            // 2) ข้อต่อ (connection)
            String c1 = clean(current.getConnectionType());
            String c2 = clean(other.getConnectionType());
            if (c1 != null && c1.equals(c2)) {
                score += 3;
                tags.add("Same connection");
            } else {
                String k = sharedKeyword(c1, c2, "conical", "hex", "octa", "tri", "morse");
                if (k != null) {
                    score += 2;
                    tags.add(capitalize(k) + " connection");
                }
            }

            // 3) ชนิด (bone level / tissue level ...)
            String t1 = clean(current.getType());
            if (t1 != null && t1.equals(clean(other.getType()))) {
                score += 2;
                tags.add(other.getType().trim());
            }

            // 4) วัสดุ
            String m1 = current.getMaterial() == null ? null : clean(current.getMaterial().getMaterialName());
            String m2 = other.getMaterial() == null ? null : clean(other.getMaterial().getMaterialName());
            if (m1 != null && m1.equals(m2)) {
                score += 1;
                tags.add("Same material");
            } else if (sharedKeyword(m1, m2, "roxolid", "zirco", "titanium") != null) {
                score += 1;
            }

            // 5) ผิว
            String s1 = clean(current.getSurfaceTreatment());
            if (s1 != null && s1.equals(clean(other.getSurfaceTreatment()))) {
                score += 1;
                tags.add("Same surface");
            }

            if (score > 0) {
                // ลิงก์ไปหน้า "รายละเอียด" ของขนาดที่ใกล้เคียงที่สุดเลย (ไม่ต้องผ่านหน้าเลือกขนาด)
                ImplantSize best = closestSize(sizes, diameter, length);
                if (best != null) {
                    link += "?diameter=" + plain(best.getDiameterMm()) + "&length=" + plain(best.getLengthMm());
                }
                // แนบรุ่น/ขนาดที่ดูอยู่ไปด้วย เพื่อให้หน้าถัดไปแสดง breadcrumb ย้อนกลับมาที่รุ่นนี้ได้
                link += (link.contains("?") ? "&" : "?") + "from=" + current.getModelId();
                if (diameter != null && length != null) {
                    link += "&fromD=" + plain(diameter) + "&fromL=" + plain(length);
                }
                result.add(new SimilarImplant(other, link, score, tags.stream().limit(3).toList()));
            }
        }

        result.sort(Comparator.comparingInt(SimilarImplant::getScore).reversed());

        // เลือกแบรนด์ละ 1 รุ่นก่อน (ให้ได้หลายแบรนด์) ถ้ายังไม่ครบ 4 ค่อยเติมรุ่นที่เหลือตามคะแนน
        List<SimilarImplant> picked = new ArrayList<>();
        java.util.Set<Long> usedBrands = new java.util.HashSet<>();
        for (SimilarImplant s : result) {
            if (picked.size() >= MAX_SIMILAR) break;
            if (usedBrands.add(s.getModel().getBrand().getBrandId())) picked.add(s);
        }
        for (SimilarImplant s : result) {
            if (picked.size() >= MAX_SIMILAR) break;
            if (!picked.contains(s)) picked.add(s);
        }
        return picked;
    }

    /** ขนาดที่ใกล้กับขนาดที่ผู้ใช้เลือกมากที่สุด (ถ้าไม่ได้เลือกขนาด ใช้ขนาดแรก) */
    private static ImplantSize closestSize(List<ImplantSize> sizes, BigDecimal diameter, BigDecimal length) {
        if (sizes.isEmpty()) return null;
        if (diameter == null || length == null) return sizes.get(0);
        ImplantSize best = null;
        double bestDiff = Double.MAX_VALUE;
        for (ImplantSize s : sizes) {
            if (s.getDiameterMm() == null || s.getLengthMm() == null) continue;
            // ให้ diameter สำคัญกว่าความยาว (คูณ 10)
            double diff = Math.abs(s.getDiameterMm().doubleValue() - diameter.doubleValue()) * 10
                        + Math.abs(s.getLengthMm().doubleValue() - length.doubleValue());
            if (diff < bestDiff) {
                bestDiff = diff;
                best = s;
            }
        }
        return best != null ? best : sizes.get(0);
    }

    /** รุ่นที่ผู้ใช้ทั่วไปมองเห็น */
    private boolean isPublic(ImplantModel implant) {
        return ImplantService.isPublic(implant);
    }

    private List<ImplantSize> visibleSizes(ImplantModel implant) {
        return implant.getSizeList().stream()
                .filter(size -> !"Hidden".equals(size.getStatus()))
                .toList();
    }

    private static boolean same(BigDecimal a, BigDecimal b) {
        return a != null && b != null && a.compareTo(b) == 0;
    }

    private static String plain(BigDecimal v) {
        return v.stripTrailingZeros().toPlainString();
    }

    /** ตัดค่าว่าง / "Not specified" ทิ้ง แล้วทำเป็นตัวเล็ก เพื่อเทียบกันได้ */
    private static String clean(String v) {
        if (v == null) return null;
        String s = v.trim().toLowerCase(Locale.ROOT);
        return s.isEmpty() || s.equals("-") || s.startsWith("not specified") ? null : s;
    }

    private static String sharedKeyword(String a, String b, String... keywords) {
        if (a == null || b == null) return null;
        for (String k : keywords) {
            if (a.contains(k) && b.contains(k)) return k;
        }
        return null;
    }

    private static String capitalize(String s) {
        return s.isEmpty() ? s : Character.toUpperCase(s.charAt(0)) + s.substring(1);
    }

    /** ข้อมูลรุ่นแนะนำ 1 รายการ (ใช้ในหน้า model-detail.html) */
    public static class SimilarImplant {
        private final ImplantModel model;
        private final String link;
        private final int score;
        private final List<String> tags;

        public SimilarImplant(ImplantModel model, String link, int score, List<String> tags) {
            this.model = model;
            this.link = link;
            this.score = score;
            this.tags = tags;
        }

        public ImplantModel getModel() { return model; }
        public String getLink() { return link; }
        public int getScore() { return score; }
        public List<String> getTags() { return tags; }
    }
}