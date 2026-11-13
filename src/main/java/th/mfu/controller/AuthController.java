
package th.mfu.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import th.mfu.domain.Admin;
import th.mfu.repository.AdminRepository;

@Controller
public class AuthController {

    @Autowired
    private AdminRepository adminRepo;

    // ตัวเข้ารหัสรหัสผ่าน BCrypt ตัวเดียวกับที่ใช้ตอนสมัครและเปลี่ยนรหัสผ่าน
    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/admin/login")
    public String loginPage() {
        return "admin/login";
    }

    @PostMapping("/admin/login")
    public String login(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        // Remove unnecessary spaces from email or username
        String cleanInput = email != null ? email.trim() : "";

        // Find admin using either email or username
        Admin admin = adminRepo
                .findByEmailOrUsername(cleanInput, cleanInput)
                .orElse(null);

        // Verify admin account and BCrypt password
        if (admin != null
                && admin.getPasswordHash() != null
                && passwordEncoder.matches(password, admin.getPasswordHash())) {

            // Preserve existing avatar handling
            if (admin.getAvatarLink() == null ||
                    !ProfileController.AVATARS.contains(admin.getAvatarLink())) {

                admin.setAvatarLink(ProfileController.AVATARS.get(0));
                admin = adminRepo.save(admin);
            }

            // Store logged-in admin in session
            session.setAttribute("admin", admin);

            // Login success notification
            redirectAttributes.addFlashAttribute(
                    "notificationMessage",
                    "Welcome back, Admin!"
            );

            redirectAttributes.addFlashAttribute(
                    "notificationType",
                    "success"
            );

            return "redirect:/admin/data-management";
        }

        // Preserve existing unsuccessful login behavior
        return "redirect:/admin/login?error=true";
    }

    @GetMapping("/admin/logout")
    public String logout(
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        // Invalidate admin session
        session.invalidate();

        // Logout success notification
        redirectAttributes.addFlashAttribute(
                "notificationMessage",
                "You have been logged out successfully."
        );

        redirectAttributes.addFlashAttribute(
                "notificationType",
                "success"
        );

        return "redirect:/";
    }
}
