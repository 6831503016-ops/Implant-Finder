package th.mfu.domain;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "IMPLANT_SIZE",
       uniqueConstraints = @UniqueConstraint(columnNames = {"model_id", "diameter_mm", "length_mm"}))
public class ImplantSize {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long sizeId;

    @ManyToOne(optional = false)
    @JoinColumn(name = "model_id", nullable = false)
    private ImplantModel model;

    @Column(name = "diameter_mm", nullable = false, precision = 4, scale = 2)
    private BigDecimal diameterMm;

    @Column(name = "length_mm", nullable = false, precision = 4, scale = 1)
    private BigDecimal lengthMm;

    @Column(length = 30)
    private String productCode;

    @Column(length = 255)
    private String variantNote;

    public Long getSizeId() { return sizeId; }
    public void setSizeId(Long sizeId) { this.sizeId = sizeId; }
    public ImplantModel getModel() { return model; }
    public void setModel(ImplantModel model) { this.model = model; }
    public BigDecimal getDiameterMm() { return diameterMm; }
    public void setDiameterMm(BigDecimal d) { this.diameterMm = d; }
    public BigDecimal getLengthMm() { return lengthMm; }
    public void setLengthMm(BigDecimal l) { this.lengthMm = l; }
    public String getProductCode() { return productCode; }
    public void setProductCode(String p) { this.productCode = p; }
    public String getVariantNote() { return variantNote; }
    public void setVariantNote(String n) { this.variantNote = n; }
}