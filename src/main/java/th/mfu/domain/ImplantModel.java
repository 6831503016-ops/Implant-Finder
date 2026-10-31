package th.mfu.domain;

import jakarta.persistence.*;
import java.util.ArrayList; 
import java.util.List;

@Entity
@Table(name = "IMPLANT_MODEL", uniqueConstraints = @UniqueConstraint(columnNames = {"brand_id", "model_name"}))
public class ImplantModel {
        @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long modelId;

    @ManyToOne
    @JoinColumn(name = "brand_id", nullable = false)
    private Brand brand;

    @ManyToOne
    @JoinColumn(name = "material_id")
    private Material material;

    @ManyToOne
    @JoinColumn(name = "created_by")
    private Admin createdBy;

    @OneToMany(mappedBy = "model", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("diameterMm ASC, lengthMm ASC")
    private List<ImplantSize> sizeList = new ArrayList<>();

    @Column(name = "model_name", nullable = false)
    private String modelName;

    private String type;
    private String connectionType;
    private String surfaceTreatment;
    private String color;
    private String status = "Visible"; // Visible / Hidden
    private String imageUrl;
    public ImplantModel() {}

    public Long getModelId() { return modelId; }
    public void setModelId(Long modelId) { this.modelId = modelId; }
    public Brand getBrand() { return brand; }
    public void setBrand(Brand brand) { this.brand = brand; }
    public String getModelName() { return modelName; }
    public void setModelName(String modelName) { this.modelName = modelName; }
   
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public String getConnectionType() { return connectionType; }
    public void setConnectionType(String connectionType) { this.connectionType = connectionType; }
    public String getSurfaceTreatment() { return surfaceTreatment; }
    public void setSurfaceTreatment(String surfaceTreatment) { this.surfaceTreatment = surfaceTreatment; }
   
    public String getColor() { return color; }
    public void setColor(String color) { this.color = color; }
  
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
        public Material getMaterial() { return material; }
    public void setMaterial(Material material) { this.material = material; }
    public Admin getCreatedBy() { return createdBy; }
    public void setCreatedBy(Admin createdBy) { this.createdBy = createdBy; }
    public List<ImplantSize> getSizeList() { return sizeList; }
    public void setSizeList(List<ImplantSize> sizeList) { this.sizeList = sizeList; }

    // Not a column. Builds "Ø 3 x 8 mm, Ø 3 x 9 mm" so your pages and JavaScript keep working.
    public String getSizes() {
        StringBuilder sb = new StringBuilder();
        for (ImplantSize s : sizeList) {
            if (sb.length() > 0) sb.append(", ");
            sb.append("Ø ").append(s.getDiameterMm().stripTrailingZeros().toPlainString())
              .append(" x ").append(s.getLengthMm().stripTrailingZeros().toPlainString()).append(" mm");
            if (s.getVariantNote() != null && !s.getVariantNote().isBlank()) {
                sb.append(" (").append(s.getVariantNote().trim()).append(")");
            }
        }
        return sb.toString();
    }
}