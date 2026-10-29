package th.mfu.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import th.mfu.domain.Admin;
import th.mfu.repository.AdminRepository;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Set;

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
    
@GetMapping("/avatar")
public String showAvatarPage(HttpSession session, Model model) {
    Admin admin = (Admin) session.getAttribute("admin");

    if (admin == null) {
        return "redirect:/admin/login";
    }

    model.addAttribute("admin", admin);
    return "admin/avatar";
}

@PostMapping("/avatar")
public String confirmAvatar(
        @RequestParam String avatarLink,
        HttpSession session,
        RedirectAttributes redirectAttributes) {

    Admin sessionAdmin = (Admin) session.getAttribute("admin");

    if (sessionAdmin == null) {
        return "redirect:/admin/login";
    }

    Set<String> allowedAvatars = Set.of(
        "https://api.dicebear.com/7.x/bottts/svg?seed=Admin1",
        "https://api.dicebear.com/7.x/bottts/svg?seed=Alex",
        "https://api.dicebear.com/7.x/bottts/svg?seed=Mia",
        "https://api.dicebear.com/7.x/bottts/svg?seed=Sam",
        "https://api.dicebear.com/7.x/bottts/svg?seed=Taylor",
        "https://api.dicebear.com/7.x/bottts/svg?seed=Jordan"
    );

    if (!allowedAvatars.contains(avatarLink)) {
        return "redirect:/admin/avatar";
    }

    Admin admin = adminRepo
        .findById(sessionAdmin.getAdminId())
        .orElse(null);

    if (admin == null) {
        session.invalidate();
        return "redirect:/admin/login";
    }

    admin.setAvatarLink(avatarLink);

    Admin savedAdmin = adminRepo.save(admin);
    session.setAttribute("admin", savedAdmin);

    redirectAttributes.addFlashAttribute(
        "successMessage",
        "Avatar updated successfully!"
    );

    return "redirect:/admin/profile";
}

}