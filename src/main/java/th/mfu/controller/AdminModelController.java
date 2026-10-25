package th.mfu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import th.mfu.domain.Brand;
import th.mfu.domain.ImplantModel;
import th.mfu.repository.BrandRepository;
import th.mfu.repository.ImplantModelRepository;
import th.mfu.service.ImplantService;

@Controller
@RequestMapping("/admin")
public class AdminModelController {

    @Autowired
    private ImplantService implantService;

    @Autowired
    private ImplantModelRepository modelRepo;

    @Autowired
    private BrandRepository brandRepo;

    @GetMapping("/data-management")
    public String dataManagement(Model model) {
        model.addAttribute("models", implantService.getAllModelsForAdmin());
        return "admin/data-management";
    }

    @GetMapping("/add-model")
    public String addModelForm(Model model) {
        model.addAttribute("brands", brandRepo.findAll());
        model.addAttribute("implant", new ImplantModel());
        return "admin/add-model";
    }

    @PostMapping("/add-model")
    public String saveModel(@ModelAttribute ImplantModel implant, @RequestParam("brandId") Long brandId) {
        Brand brand = brandRepo.findById(brandId).orElse(null);
        if (brand != null) {
            implant.setBrand(brand);
            // กำหนดค่าเริ่มต้นกรณีเว้นว่าง
            if (implant.getImageUrl() == null || implant.getImageUrl().trim().isEmpty()) {
                implant.setImageUrl("https://images.unsplash.com/photo-1588776814546-1ffcf47267a5?w=500&auto=format&fit=crop");
            }
            if (implant.getStatus() == null) {
                implant.setStatus("Visible");
            }
            modelRepo.save(implant);
        }
        return "redirect:/admin/data-management";
    }

    // =====  เปิดหน้าแก้ไข โดยโหลดข้อมูลเดิมมาใส่ฟอร์ม =====
    @GetMapping("/edit-model/{id}")
    public String editModelForm(@PathVariable Long id, Model model) {
        ImplantModel implant = modelRepo.findById(id).orElseThrow();
        model.addAttribute("implant", implant);
        model.addAttribute("brands", brandRepo.findAll());
        return "admin/edit-model";
    }

    // =====  บันทึกการแก้ไข =====
    @PostMapping("/edit-model/{id}")
    public String updateModel(@PathVariable Long id, @ModelAttribute ImplantModel form) {
        ImplantModel implant = modelRepo.findById(id).orElseThrow();

        implant.setModelName(form.getModelName());
        implant.setMaterial(form.getMaterial());
        implant.setSizes(form.getSizes());

        // เปลี่ยนแบรนด์ (ดึงจากฐานข้อมูลตาม id ที่เลือก)
        if (form.getBrand() != null && form.getBrand().getBrandId() != null) {
            implant.setBrand(brandRepo.findById(form.getBrand().getBrandId()).orElseThrow());
        }

        // เปลี่ยนรูปเฉพาะตอนที่กรอกลิงก์ใหม่ ถ้าเว้นว่างไว้จะใช้รูปเดิม
        if (form.getImageUrl() != null && !form.getImageUrl().isBlank()) {
            implant.setImageUrl(form.getImageUrl());
        }

        // status ไม่แตะ เพื่อให้สถานะเปิด/ปิดเหมือนเดิม
        modelRepo.save(implant);
        return "redirect:/admin/data-management";
    }

    @PostMapping("/toggle-status/{id}")
    public String toggleStatus(@PathVariable Long id) {
        implantService.toggleStatus(id);
        return "redirect:/admin/data-management";
    }

    @PostMapping("/delete/{id}")
    public String deleteModel(@PathVariable Long id) {
        modelRepo.deleteById(id);
        return "redirect:/admin/data-management";
    }
}