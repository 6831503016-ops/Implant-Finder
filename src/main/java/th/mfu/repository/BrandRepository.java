package th.mfu.repository;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import th.mfu.domain.Brand;

public interface BrandRepository extends JpaRepository<Brand, Long> {
    Optional<Brand> findByBrandNameIgnoreCase(String brandName);
}