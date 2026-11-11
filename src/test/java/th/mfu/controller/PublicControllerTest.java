package th.mfu.controller;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import th.mfu.domain.Brand;
import th.mfu.domain.ImplantModel;
import th.mfu.repository.BrandRepository;
import th.mfu.repository.ImplantModelRepository;
import th.mfu.service.ImplantService;

@SpringBootTest
@AutoConfigureMockMvc
class PublicControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private BrandRepository brandRepo;

    @Autowired
    private ImplantModelRepository modelRepo;

    @Autowired
    private ImplantService implantService;

    @Test
    @Transactional
    void hiddenModelIsNotListedOrAccessible() throws Exception {
        Brand brand = new Brand();
        brand.setBrandName("Hidden model test " + System.nanoTime());
        brandRepo.saveAndFlush(brand);

        ImplantModel hiddenModel = new ImplantModel();
        hiddenModel.setBrand(brand);
        hiddenModel.setModelName("Hidden model " + System.nanoTime());
        modelRepo.saveAndFlush(hiddenModel);

        implantService.toggleStatus(hiddenModel.getModelId());

        String brandPage = mockMvc.perform(get("/brand/{id}", brand.getBrandId()))
                .andExpect(status().isOk())
                .andReturn()
                .getResponse()
                .getContentAsString();

        assertThat(brandPage).doesNotContain(hiddenModel.getModelName());

        mockMvc.perform(get("/model/{id}", hiddenModel.getModelId()))
                .andExpect(status().is3xxRedirection())
                .andExpect(result -> assertThat(result.getResponse().getRedirectedUrl()).isEqualTo("/"));
    }
}
