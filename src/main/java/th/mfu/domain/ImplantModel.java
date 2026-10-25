package th.mfu.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "IMPLANT_MODEL")
public class ImplantModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long modelId;

    @ManyToOne
    @JoinColumn(name = "brand_id", nullable = false)
    private Brand brand;

    @Column(nullable = false)
    private String modelName;

    private String material;
    private String type;
    private String connectionType;
    private String surfaceTreatment;
    private String country;
    private String color;
    @Column(length = 4000)
    private String sizes;
    private String status = "Visible"; // Visible / Hidden[cite: 51]
    private String imageUrl;

    public ImplantModel() {}

    public Long getModelId() { return modelId; }
    public void setModelId(Long modelId) { this.modelId = modelId; }
    public Brand getBrand() { return brand; }
    public void setBrand(Brand brand) { this.brand = brand; }
    public String getModelName() { return modelName; }
    public void setModelName(String modelName) { this.modelName = modelName; }
    public String getMaterial() { return material; }
    public void setMaterial(String material) { this.material = material; }
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public String getConnectionType() { return connectionType; }
    public void setConnectionType(String connectionType) { this.connectionType = connectionType; }
    public String getSurfaceTreatment() { return surfaceTreatment; }
    public void setSurfaceTreatment(String surfaceTreatment) { this.surfaceTreatment = surfaceTreatment; }
    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }
    public String getColor() { return color; }
    public void setColor(String color) { this.color = color; }
    public String getSizes() { return sizes; }
    public void setSizes(String sizes) { this.sizes = sizes; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
}