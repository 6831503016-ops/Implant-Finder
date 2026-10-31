package th.mfu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import th.mfu.domain.ImplantModel;
import th.mfu.repository.ImplantModelRepository;
import java.util.List;
import th.mfu.domain.*;
import th.mfu.repository.BrandRepository;
import th.mfu.repository.MaterialRepository;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class ImplantService {

    @Autowired
    private ImplantModelRepository modelRepo;
        @Autowired private BrandRepository brandRepo;
    @Autowired private MaterialRepository materialRepo;

    private static final Pattern SIZE = Pattern.compile(
        "Ø?\\s*(\\d+(?:\\.\\d+)?)\\s*[xX×]\\s*(\\d+(?:\\.\\d+)?)\\s*(?:mm)?(?:\\s*\\(([^)]*)\\))?");

    public List<ImplantModel> getAllModelsForAdmin() {
        return modelRepo.findAll();
    }

    public void toggleStatus(Long id) {
        ImplantModel model = modelRepo.findById(id).orElse(null);
        if (model != null) {
            model.setStatus("Visible".equals(model.getStatus()) ? "Hidden" : "Visible");
            modelRepo.save(model);
        }
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

    // Turns "Ø 4.3 x 10 mm, Ø 4.3 x 8.5 mm" into IMPLANT_SIZE rows.
    // Sizes that already exist are kept, new ones are added, missing ones are removed.
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
            if (m.group(3) != null && !m.group(3).isBlank()) s.setVariantNote(m.group(3).trim());
            result.add(s);
        }
        model.getSizeList().clear();
        model.getSizeList().addAll(result);
    }

    private String key(BigDecimal d, BigDecimal l) {
        return d.stripTrailingZeros().toPlainString() + "x" + l.stripTrailingZeros().toPlainString();
    }
}