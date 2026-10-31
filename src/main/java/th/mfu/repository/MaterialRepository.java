package th.mfu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import th.mfu.domain.Material;
import java.util.Optional;

public interface MaterialRepository extends JpaRepository<Material, Long> {
    Optional<Material> findByMaterialNameIgnoreCase(String materialName);
}