
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

    @Override
    public void run(String... args) {
        migrateLegacyPasswords();

        // Check whether the database already contains brands
        if (brandRepo.count() > 0) {
            System.out.println("Database already contains data. Skipping seed.");
            return;
        }

        // Run data.sql only when the database is empty
        System.out.println("Database is empty. Loading sample data...");

        ResourceDatabasePopulator populator =
                new ResourceDatabasePopulator(seed);

        populator.setSqlScriptEncoding("UTF-8");
        populator.execute(dataSource);

        seedAdmin();

        System.out.println("Sample data loaded successfully.");
    }

    private void migrateLegacyPasswords() {
        for (Admin admin : adminRepo.findAll()) {
            String passwordHash = admin.getPasswordHash();
            if (passwordHash != null && !BCRYPT_HASH.matcher(passwordHash).matches()) {
                admin.setPasswordHash(passwordEncoder.encode(passwordHash));
                adminRepo.save(admin);
            }
        }
    }

    private void seedAdmin() {
        Admin admin = new Admin();
        admin.setFullName("Admin User");
        admin.setUsername("@implantadmin");
        admin.setEmail("admin@implant.com");
        admin.setPasswordHash(passwordEncoder.encode("123456"));
        admin.setAvatarLink("/images/avatars/avatar1.png");
        adminRepo.save(admin);
    }
}
