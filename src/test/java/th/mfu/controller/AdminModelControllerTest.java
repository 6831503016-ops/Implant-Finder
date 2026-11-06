package th.mfu.controller;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import th.mfu.domain.ImplantModel;
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

    @Test
    @Transactional
    void newestModelAppearsFirstInAdminTable() throws Exception {
        ImplantModel newestModel = new ImplantModel();
        newestModel.setBrand(modelRepo.findAll().get(0).getBrand());
        String modelName = "Newest model " + System.nanoTime();
        newestModel.setModelName(modelName);
        modelRepo.saveAndFlush(newestModel);

        String page = mockMvc.perform(get("/admin/data-management"))
                .andExpect(status().isOk())
                .andReturn()
                .getResponse()
                .getContentAsString();

        Matcher firstModelCell = Pattern.compile(
                "<td class=\"dm-text model-cell\">([^<]*)</td>").matcher(page);
        assertThat(firstModelCell.find()).isTrue();
        assertThat(firstModelCell.group(1)).isEqualTo(modelName);
    }
}
