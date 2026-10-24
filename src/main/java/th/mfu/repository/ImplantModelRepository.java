package th.mfu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import th.mfu.domain.ImplantModel;
import java.util.List;

public interface ImplantModelRepository extends JpaRepository<ImplantModel, Long> {
    List<ImplantModel> findByBrandBrandIdAndStatus(Long brandId, String status);
    List<ImplantModel> findByStatus(String status);
    boolean existsByBrandBrandIdAndModelName(Long brandId, String modelName);
}