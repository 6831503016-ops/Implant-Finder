package th.mfu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import th.mfu.repository.BrandRepository;
import th.mfu.repository.ImplantModelRepository;
import th.mfu.domain.ImplantModel;
import th.mfu.domain.ImplantSize;

import java.util.stream.Collectors;

@Controller
public class PublicController {

    @Autowired
    private BrandRepository brandRepo;
    
    @Autowired
    private ImplantModelRepository modelRepo;

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("brands", brandRepo.findAll());
        return "public/home";
    }

    @GetMapping("/brand/{id}")
    public String brandModels(@PathVariable Long id, Model model) {
        model.addAttribute("brand", brandRepo.findById(id).orElse(null));
        model.addAttribute("models", modelRepo.findByBrandBrandId(id).stream()
                .filter(implant -> implant.getSizeList().isEmpty()
                        ? "Visible".equals(implant.getStatus())
                        : implant.getSizeList().stream()
                                .anyMatch(size -> !"Hidden".equals(size.getStatus())))
                .toList());
        return "public/brand-models";
    }

    @GetMapping("/model/{id}")
    public String modelDetail(@PathVariable Long id, Model model) {
        ImplantModel implant = modelRepo.findById(id).orElse(null);
        model.addAttribute("implant", implant);
        if (implant != null) {
            String visibleSizes = implant.getSizeList().stream()
                    .filter(size -> !"Hidden".equals(size.getStatus()))
                    .map(ImplantSize::getDisplaySize)
                    .collect(Collectors.joining(", "));
            model.addAttribute("visibleSizes", visibleSizes);
        }
        return "public/model-detail";
    }
}