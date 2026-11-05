package th.mfu.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import th.mfu.domain.Brand;
import th.mfu.domain.ImplantModel;
import th.mfu.domain.ImplantSize;
import th.mfu.domain.Material;
import th.mfu.repository.BrandRepository;
import th.mfu.repository.ImplantModelRepository;
import th.mfu.repository.ImplantSizeRepository;
import th.mfu.repository.MaterialRepository;
import java.util.stream.Collectors;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


@Service
public class ImplantService {


    @Autowired
    private ImplantModelRepository modelRepo;


    @Autowired
    private ImplantSizeRepository sizeRepo;
    

    @Autowired
    private BrandRepository brandRepo;


    @Autowired
    private MaterialRepository materialRepo;


    // รูปแบบขนาด เช่น "Ø 4.3 x 10 mm (note)"
    private static final Pattern SIZE = Pattern.compile(
        "Ø?\\s*(\\d+(?:\\.\\d+)?)\\s*[xX×]\\s*(\\d+(?:\\.\\d+)?)\\s*(?:mm)?(?:\\s*\\(([^)]*)\\))?");


    public List<ImplantModel> getAllModelsForAdmin() {
        return modelRepo.findAll();
    }


    // สวิตช์ของรุ่น = เปิด/ปิดทุกขนาดของรุ่นนั้นพร้อมกัน
    public void toggleStatus(Long id) {
        ImplantModel model = modelRepo.findById(id).orElse(null);
        if (model != null) {
            String newStatus = "Visible".equals(model.getStatus()) ? "Hidden" : "Visible";
            model.setStatus(newStatus);
            model.getSizeList().forEach(size -> size.setStatus(newStatus));
            modelRepo.save(model);
        }
    }


    // สวิตช์ของแต่ละขนาด
    public void toggleSizeStatus(Long id) {
        ImplantSize size = sizeRepo.findById(id).orElseThrow();
        size.setStatus("Visible".equals(size.getStatus()) ? "Hidden" : "Visible");
        sizeRepo.save(size);
    }


    public static String blankToNull(String s) {
        return (s == null || s.isBlank()) ? null : s.trim();
    }


    public Brand findOrCreateBrand(String name) {
        String clean = name.trim();
        return brandRepo.findByBrandNameIgnoreCase(clean).orElseGet(() -> {
            Brand b = new Brand();
            b.setBrandName(clean);
            return brandRepo.save(b);
        });
    }


    public Material findOrCreateMaterial(String name) {
        if (name == null || name.isBlank()) return null;
        String clean = name.trim();
        return materialRepo.findByMaterialNameIgnoreCase(clean).orElseGet(() -> {
            Material m = new Material();
            m.setMaterialName(clean);
            return materialRepo.save(m);
        });
    }
    // รุ่นที่ผู้ใช้ทั่วไปมองเห็น: ตัวรุ่นต้อง Visible และ (ไม่มีขนาดเลย หรือมีอย่างน้อย 1 ขนาดที่ไม่ Hidden)
public static boolean isPublic(ImplantModel m) {
    if (!"Visible".equals(m.getStatus())) return false;
    return m.getSizeList().isEmpty()
            || m.getSizeList().stream().anyMatch(s -> !"Hidden".equals(s.getStatus()));
}

// เฉพาะแบรนด์ที่มีอย่างน้อย 1 รุ่นที่ผู้ใช้เห็นได้
public List<Brand> getBrandsWithPublicModels() {
    Set<Long> brandIds = modelRepo.findAll().stream()
            .filter(ImplantService::isPublic)
            .filter(m -> m.getBrand() != null)
            .map(m -> m.getBrand().getBrandId())
            .collect(Collectors.toSet());

    return brandRepo.findAll().stream()
            .filter(b -> brandIds.contains(b.getBrandId()))
            .toList();
}

    // แปลง "Ø 4.3 x 10 mm, Ø 4.3 x 8.5 mm" เป็นแถว IMPLANT_SIZE
    // ขนาดที่มีอยู่แล้วเก็บไว้ ขนาดใหม่เพิ่มเข้าไป ขนาดที่ไม่อยู่ในรายการถูกลบ
    public void syncSizes(ImplantModel model, String raw) {
        Map<String, ImplantSize> existing = new HashMap<>();
        for (ImplantSize s : model.getSizeList()) {
            existing.put(key(s.getDiameterMm(), s.getLengthMm()), s);
        }


        List<ImplantSize> result = new ArrayList<>();
        Set<String> seen = new HashSet<>();
        Matcher m = SIZE.matcher(raw == null ? "" : raw);


        while (m.find()) {
            BigDecimal d = new BigDecimal(m.group(1)).setScale(2, RoundingMode.HALF_UP);
            BigDecimal l = new BigDecimal(m.group(2)).setScale(1, RoundingMode.HALF_UP);
            String k = key(d, l);
            if (!seen.add(k)) continue;


            ImplantSize s = existing.get(k);
            if (s == null) {
                s = new ImplantSize();
                s.setModel(model);
                s.setDiameterMm(d);
                s.setLengthMm(l);
            }
            if (m.group(3) != null && !m.group(3).isBlank()) {
                s.setVariantNote(m.group(3).trim());
            }
            result.add(s);
        }


        model.getSizeList().clear();
        model.getSizeList().addAll(result);
    }


    private String key(BigDecimal d, BigDecimal l) {
        return d.stripTrailingZeros().toPlainString() + "x" + l.stripTrailingZeros().toPlainString();
    }
}