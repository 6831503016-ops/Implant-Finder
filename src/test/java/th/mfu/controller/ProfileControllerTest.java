package th.mfu.controller;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.flash;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import th.mfu.DataSeeder;
import th.mfu.domain.Admin;
import th.mfu.repository.AdminRepository;

@SpringBootTest
@AutoConfigureMockMvc
@Transactional
class ProfileControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private AdminRepository adminRepo;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private DataSeeder dataSeeder;

    private Admin admin;
    private MockHttpSession session;

    @BeforeEach
    void setUp() {
        admin = new Admin();
        admin.setFullName("Profile test admin");
        admin.setUsername("@profiletest" + System.nanoTime());
        admin.setEmail("profiletest" + System.nanoTime() + "@example.com");
        admin.setPasswordHash(passwordEncoder.encode("current password"));
        admin = adminRepo.saveAndFlush(admin);

        session = new MockHttpSession();
        session.setAttribute("admin", admin);
    }

    @Test
    void changesPasswordWithCurrentPasswordAndNewPasswordWorksForLogin() throws Exception {
        mockMvc.perform(post("/admin/profile")
                        .session(session)
                        .param("fullName", "Updated profile admin")
                        .param("username", admin.getUsername())
                        .param("email", admin.getEmail())
                        .param("newPassword", " new password ")
                        .param("confirmPassword", " new password ")
                        .param("currentPassword", "current password"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/admin/data-management"));

        Admin saved = adminRepo.findById(admin.getAdminId()).orElseThrow();
        assertThat(saved.getPasswordHash()).isNotEqualTo(" new password ");
        assertThat(passwordEncoder.matches(" new password ", saved.getPasswordHash())).isTrue();
        assertThat(passwordEncoder.matches("new password", saved.getPasswordHash())).isFalse();

        mockMvc.perform(post("/admin/login")
                        .param("email", admin.getEmail())
                        .param("password", "current password"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/admin/login?error=true"));

        mockMvc.perform(post("/admin/login")
                        .param("email", admin.getEmail())
                        .param("password", " new password "))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/admin/data-management"));
    }

    @Test
    void rejectsIncorrectCurrentPassword() throws Exception {
        mockMvc.perform(updateProfile("replacement password", "replacement password", "wrong password"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/admin/profile"))
                .andExpect(flash().attribute("errorMessage", "Current password is incorrect."));

        Admin saved = adminRepo.findById(admin.getAdminId()).orElseThrow();
        assertThat(passwordEncoder.matches("current password", saved.getPasswordHash())).isTrue();
    }

    @Test
    void rejectsMismatchedPasswordConfirmation() throws Exception {
        mockMvc.perform(updateProfile("replacement password", "different password", "current password"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/admin/profile"))
                .andExpect(flash().attribute(
                        "errorMessage", "New password and confirm password do not match."));

        Admin saved = adminRepo.findById(admin.getAdminId()).orElseThrow();
        assertThat(passwordEncoder.matches("current password", saved.getPasswordHash())).isTrue();
    }

    @Test
    void updatesProfileWithoutChangingPassword() throws Exception {
        String oldPasswordHash = admin.getPasswordHash();

        mockMvc.perform(post("/admin/profile")
                        .session(session)
                        .param("fullName", "Updated profile admin")
                        .param("username", admin.getUsername())
                        .param("email", admin.getEmail()))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/admin/data-management"));

        Admin saved = adminRepo.findById(admin.getAdminId()).orElseThrow();
        assertThat(saved.getFullName()).isEqualTo("Updated profile admin");
        assertThat(saved.getPasswordHash()).isEqualTo(oldPasswordHash);
        assertThat(passwordEncoder.matches("current password", saved.getPasswordHash())).isTrue();
    }

    @Test
    void migratesLegacyPlaintextPasswordToBcrypt() {
        admin.setPasswordHash("legacy password");
        adminRepo.saveAndFlush(admin);

        dataSeeder.run();

        Admin saved = adminRepo.findById(admin.getAdminId()).orElseThrow();
        assertThat(saved.getPasswordHash()).isNotEqualTo("legacy password");
        assertThat(passwordEncoder.matches("legacy password", saved.getPasswordHash())).isTrue();
    }

    private org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder updateProfile(
            String newPassword, String confirmPassword, String currentPassword) {
        return post("/admin/profile")
                .session(session)
                .param("fullName", admin.getFullName())
                .param("username", admin.getUsername())
                .param("email", admin.getEmail())
                .param("newPassword", newPassword)
                .param("confirmPassword", confirmPassword)
                .param("currentPassword", currentPassword);
    }
}
