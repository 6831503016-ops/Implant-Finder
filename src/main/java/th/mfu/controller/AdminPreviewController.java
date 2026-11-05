package th.mfu.controller;

import th.mfu.service.ImplantService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminPreviewController {

    private final ImplantService implantService;

    public AdminPreviewController(ImplantService implantService) {
        this.implantService = implantService;
    }

    @GetMapping("/admin/preview")
    public String showAdminPreview(Model model) {
        model.addAttribute("brands", implantService.getBrandsWithPublicModels());
        return "admin/admin-preview";
    }
}