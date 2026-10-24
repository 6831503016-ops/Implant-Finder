package th.mfu.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import th.mfu.domain.Admin;
import th.mfu.repository.AdminRepository;

@Controller
@RequestMapping("/admin")
public class ProfileController {

    @Autowired
    private AdminRepository adminRepo;

    @GetMapping("/profile")
    public String profile(HttpSession session, Model model) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) return "redirect:/admin/login";
        model.addAttribute("admin", admin);
        return "admin/profile";
    }

    @PostMapping("/profile")
    public String updateProfile(@ModelAttribute Admin adminForm, HttpSession session) {
        adminRepo.save(adminForm);
        session.setAttribute("admin", adminForm);
        return "redirect:/admin/data-management";
    }
}