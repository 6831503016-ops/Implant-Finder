
package th.mfu;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.stereotype.Component;

import th.mfu.repository.BrandRepository;

@Component
public class DataSeeder implements CommandLineRunner {

    @Autowired
    private DataSource dataSource;

    @Autowired
    private BrandRepository brandRepo;

    @Value("classpath:data.sql")
    private Resource seed;

    @Override
    public void run(String... args) {

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

        System.out.println("Sample data loaded successfully.");
    }
}
