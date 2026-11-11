package th.mfu.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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
    public String login(@RequestParam String email, @RequestParam String password, HttpSession session) {
        String cleanInput = email != null ? email.trim() : "";
        Admin admin = adminRepo.findByEmailOrUsername(cleanInput, cleanInput).orElse(null);

        if (admin != null && admin.getPasswordHash().equals(password.trim())) {

            // ถ้ายังเป็นรูปเก่า (เช่น ลิงก์ dicebear) หรือว่าง → เปลี่ยนเป็นรูป avatar ใหม่ในโฟลเดอร์ แล้วบันทึกลง DB
            if (admin.getAvatarLink() == null || !ProfileController.AVATARS.contains(admin.getAvatarLink())) {
                admin.setAvatarLink(ProfileController.AVATARS.get(0));
                admin = adminRepo.save(admin);
            }

            session.setAttribute("admin", admin);
            return "redirect:/admin/data-management";
        }
        return "redirect:/admin/login?error=true";
    }

    @GetMapping("/admin/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}