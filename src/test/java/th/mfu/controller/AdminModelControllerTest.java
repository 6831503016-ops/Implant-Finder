package th.mfu.controller;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

import th.mfu.repository.ImplantModelRepository;

@SpringBootTest
@AutoConfigureMockMvc
class AdminModelControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ImplantModelRepository modelRepo;

    @Test
    void editModelFormRendersForExistingModel() throws Exception {
        Long modelId = modelRepo.findAll().get(0).getModelId();

        mockMvc.perform(get("/admin/edit-model/{id}", modelId))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/edit-model"))
                .andExpect(content().string(containsString("name=\"country\"")))
                .andExpect(content().string(containsString("name=\"sizeValues\"")));
    }
}
