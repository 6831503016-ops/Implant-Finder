package th.mfu.controller;


import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import th.mfu.domain.Admin;
import th.mfu.repository.AdminRepository;


import java.util.List;


@Controller
@RequestMapping("/admin")
public class ProfileController {


       // รูป avatar 12 แบบ (อยู่ใน static/images/avatars)
    public static final List<String> AVATARS = List.of(
        "/images/avatars/avatar1.png",
        "/images/avatars/avatar2.png",
        "/images/avatars/avatar3.png",
        "/images/avatars/avatar4.png",
        "/images/avatars/avatar5.png",
        "/images/avatars/avatar6.png",
        "/images/avatars/avatar7.png",
        "/images/avatars/avatar8.png",
        "/images/avatars/avatar9.png",
        "/images/avatars/avatar10.png",
        "/images/avatars/avatar11.png",
        "/images/avatars/avatar12.png"
    );


    @Autowired
    private AdminRepository adminRepo;

    @Autowired
    private PasswordEncoder passwordEncoder;


    @GetMapping("/profile")
    public String profile(HttpSession session, Model model) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) return "redirect:/admin/login";
        model.addAttribute("admin", admin);
        return "admin/profile";
    }


    @PostMapping("/profile")
    public String updateProfile(
            @ModelAttribute Admin adminForm,
            @RequestParam(value = "newPassword", required = false) String newPassword,
            @RequestParam(value = "confirmPassword", required = false) String confirmPassword,
            @RequestParam(value = "currentPassword", required = false) String currentPassword,
            HttpSession session,
            RedirectAttributes ra) {


        Admin sessionAdmin = (Admin) session.getAttribute("admin");
        if (sessionAdmin == null) return "redirect:/admin/login";


        // โหลดข้อมูลจริงจากฐานข้อมูล แล้วแก้เฉพาะช่องในฟอร์ม (รหัสผ่านเดิมจะไม่หาย)
        Admin admin = adminRepo.findById(sessionAdmin.getAdminId()).orElse(null);
        if (admin == null) {
            session.invalidate();
            return "redirect:/admin/login";
        }


        admin.setFullName(adminForm.getFullName());
        admin.setUsername(adminForm.getUsername());
        admin.setEmail(adminForm.getEmail());


        // เปลี่ยนรหัสผ่าน (ถ้ากรอก New password)
        if (newPassword != null && !newPassword.isEmpty()) {
            if (currentPassword == null || admin.getPasswordHash() == null
                    || !passwordEncoder.matches(currentPassword, admin.getPasswordHash())) {
                ra.addFlashAttribute("errorMessage", "Current password is incorrect.");
                return "redirect:/admin/profile";
            }
            if (!newPassword.equals(confirmPassword)) {
                ra.addFlashAttribute("errorMessage", "New password and confirm password do not match.");
                return "redirect:/admin/profile";
            }
            admin.setPasswordHash(passwordEncoder.encode(newPassword));
        }


        Admin saved = adminRepo.save(admin);
        session.setAttribute("admin", saved);
        return "redirect:/admin/data-management";
    }


    @GetMapping("/avatar")
    public String showAvatarPage(HttpSession session, Model model) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) return "redirect:/admin/login";


        model.addAttribute("admin", admin);
        model.addAttribute("avatars", AVATARS);
        return "admin/avatar";
    }


    @PostMapping("/avatar")
    public String confirmAvatar(
            @RequestParam String avatarLink,
            HttpSession session,
            RedirectAttributes redirectAttributes) {


        Admin sessionAdmin = (Admin) session.getAttribute("admin");
        if (sessionAdmin == null) return "redirect:/admin/login";


        if (!AVATARS.contains(avatarLink)) return "redirect:/admin/avatar";


        Admin admin = adminRepo.findById(sessionAdmin.getAdminId()).orElse(null);
        if (admin == null) {
            session.invalidate();
            return "redirect:/admin/login";
        }


        admin.setAvatarLink(avatarLink);
        Admin savedAdmin = adminRepo.save(admin);
        session.setAttribute("admin", savedAdmin);


        redirectAttributes.addFlashAttribute("successMessage", "Avatar updated successfully!");
        return "redirect:/admin/profile";
    }
}