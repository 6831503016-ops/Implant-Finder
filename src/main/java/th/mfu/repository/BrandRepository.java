package th.mfu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import th.mfu.domain.Brand;

public interface BrandRepository extends JpaRepository<Brand, Long> {
}