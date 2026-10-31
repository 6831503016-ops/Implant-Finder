package th.mfu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import th.mfu.domain.ImplantModel;
import java.util.List;
import java.util.Optional;


public interface ImplantModelRepository extends JpaRepository<ImplantModel, Long> {
    List<ImplantModel> findByBrandBrandIdAndStatus(Long brandId, String status);
    List<ImplantModel> findByStatus(String status);
    Optional<ImplantModel> findByBrandBrandIdAndModelNameIgnoreCase(Long brandId, String modelName);
}