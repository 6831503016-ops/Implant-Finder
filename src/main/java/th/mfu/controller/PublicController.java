package th.mfu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import th.mfu.repository.BrandRepository;
import th.mfu.repository.ImplantModelRepository;

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
        model.addAttribute("models", modelRepo.findByBrandBrandIdAndStatus(id, "Visible"));
        return "public/brand-models";
    }

    @GetMapping("/model/{id}")
    public String modelDetail(@PathVariable Long id, Model model) {
        model.addAttribute("implant", modelRepo.findById(id).orElse(null));
        return "public/model-detail";
    }
}