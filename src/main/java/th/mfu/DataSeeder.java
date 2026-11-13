
package th.mfu;

import javax.sql.DataSource;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import th.mfu.domain.Admin;
import th.mfu.repository.AdminRepository;
import th.mfu.repository.BrandRepository;

@Component
public class DataSeeder implements CommandLineRunner {

    private static final Pattern BCRYPT_HASH =
            Pattern.compile("\\$2[aby]\\$\\d{2}\\$[./A-Za-z0-9]{53}");

    @Autowired
    private DataSource dataSource;

    @Autowired
    private AdminRepository adminRepo;

    @Autowired
    private BrandRepository brandRepo;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Value("classpath:data.sql")
    private Resource seed;

    // Initial admin password from application.properties or environment variable
    @Value("${app.admin.password:${APP_ADMIN_PASSWORD:}}")
    private String initialAdminPassword;

    @Override
    public void run(String... args) {

        // Migrate existing plaintext passwords to BCrypt
        migrateLegacyPasswords();

        // Load sample data if database is empty
        if (brandRepo.count() == 0) {

            System.out.println("Database is empty. Loading sample data...");

            ResourceDatabasePopulator populator =
                    new ResourceDatabasePopulator(seed);

            populator.setSqlScriptEncoding("UTF-8");
            populator.execute(dataSource);

            System.out.println("Sample data loaded successfully.");

        } else {
            System.out.println("Database already contains data.");
        }

        // Ensure administrator account is secured
        secureAdminAccount();
    }

    private void secureAdminAccount() {

        Admin admin = adminRepo
                .findByEmailOrUsername(
                        "admin@implant.com",
                        "@implantadmin")
                .orElse(null);

        // Existing administrator account
        if (admin != null) {

            String storedPassword = admin.getPasswordHash();

            // Secure password if it is not already a valid BCrypt hash
            if (storedPassword != null &&
                    !BCRYPT_HASH.matcher(storedPassword).matches()) {

                admin.setPasswordHash(
                        passwordEncoder.encode(storedPassword));

                adminRepo.save(admin);

                System.out.println(
                        "Existing administrator password secured.");
            }

            return;
        }

        // Do not create an administrator without a configured password
        if (initialAdminPassword == null ||
                initialAdminPassword.isBlank()) {

            System.out.println(
                    "No initial administrator password configured. "
                    + "Administrator account was not created.");

            return;
        }

        // Create initial administrator account
        seedAdmin();

        System.out.println(
                "Initial administrator account created successfully.");
    }

    // Migrate existing plaintext passwords to BCrypt
    private void migrateLegacyPasswords() {

        for (Admin admin : adminRepo.findAll()) {

            String passwordHash = admin.getPasswordHash();

            if (passwordHash != null &&
                    !BCRYPT_HASH.matcher(passwordHash).matches()) {

                admin.setPasswordHash(
                        passwordEncoder.encode(passwordHash));

                adminRepo.save(admin);
            }
        }
    }

    // Create initial administrator account
    private void seedAdmin() {

        Admin admin = new Admin();

        admin.setFullName("Admin User");
        admin.setUsername("@implantadmin");
        admin.setEmail("admin@implant.com");

        // Use configured password instead of hardcoded password
        admin.setPasswordHash(
                passwordEncoder.encode(initialAdminPassword));

        admin.setAvatarLink("/images/avatars/avatar1.png");

        adminRepo.save(admin);
    }
}
