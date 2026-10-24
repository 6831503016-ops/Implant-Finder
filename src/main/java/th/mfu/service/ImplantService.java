package th.mfu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import th.mfu.domain.ImplantModel;
import th.mfu.repository.ImplantModelRepository;
import java.util.List;

@Service
public class ImplantService {

    @Autowired
    private ImplantModelRepository modelRepo;

    public List<ImplantModel> getAllModelsForAdmin() {
        return modelRepo.findAll();
    }

    public void toggleStatus(Long id) {
        ImplantModel model = modelRepo.findById(id).orElse(null);
        if (model != null) {
            model.setStatus("Visible".equals(model.getStatus()) ? "Hidden" : "Visible");
            modelRepo.save(model);
        }
    }
}