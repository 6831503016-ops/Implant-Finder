package th.mfu.controller;

import th.mfu.repository.BrandRepository;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminPreviewController {

    private final BrandRepository brandRepository;

    public AdminPreviewController(BrandRepository brandRepository) {
        this.brandRepository = brandRepository;
    }

    @GetMapping("/admin/preview")
    public String showAdminPreview(Model model) {

        model.addAttribute("brands", brandRepository.findAll());

        return "admin/admin-preview";
    }
}