package th.mfu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import th.mfu.domain.Brand;
import th.mfu.repository.BrandRepository;

@Controller
@RequestMapping("/admin")
public class AdminBrandController {

    @Autowired
    private BrandRepository brandRepo;

    @GetMapping("/brands")
    public String listBrands(Model model) {
        model.addAttribute("brands", brandRepo.findAll());
        return "admin/data-management";
    }

    @PostMapping("/add-brand")
    public String addBrand(@ModelAttribute Brand brand) {
        brandRepo.save(brand);
        return "redirect:/admin/data-management";
    }
}