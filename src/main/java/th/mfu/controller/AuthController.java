
package th.mfu.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import th.mfu.domain.Admin;
import th.mfu.repository.AdminRepository;

@Controller
public class AuthController {

    @Autowired
    private AdminRepository adminRepo;

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

        String cleanInput = email != null ? email.trim() : "";

        Admin admin = adminRepo
                .findByEmailOrUsername(cleanInput, cleanInput)
                .orElse(null);

        if (admin != null && admin.getPasswordHash().equals(password.trim())) {

            // Preserve existing avatar handling
            if (admin.getAvatarLink() == null ||
                    !ProfileController.AVATARS.contains(admin.getAvatarLink())) {

                admin.setAvatarLink(ProfileController.AVATARS.get(0));
                admin = adminRepo.save(admin);
            }

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
