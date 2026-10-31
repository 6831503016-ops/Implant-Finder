
# Dental Implant Database Management System
---

## Project Overview
Currently, information regarding dental implants available in Thailand is scattered across multiple websites belonging to various manufacturers and importers. Consequently, dentists, medical personnel, and the general public face difficulty in searching and accessing complete product specifications efficiently.

The **Dental Implant Database Management System** is a standalone web-based platform designed to centralize comprehensive information on various dental implant brands, models, sizes, and specifications available in Thailand into a single place.

---

## Business Objectives & Vision
1. **Centralize Information:** Aggregate dental implant data (brands, models, dimensions, materials) across Thailand into a single platform.
2. **Convenient Public Access:** Allow general users and medical staff to conveniently search and access detailed dental implant specifications.
3. **Data Management System:** Provide an administrative management system to add, edit, delete, and control the visibility of implant records to maintain data accuracy and up-to-date information.

---

## Team Members (Group 4)

| No. | Student ID | Name | 
|---|---|---|
| 1 | 6831503016 | Saung Pan Nwe | 
| 2 | 6831503032 | Kritsaya Ketsin | 
| 3 | 6831503066 | Raksasinee Chobchonchai | 
| 4 | 6831503071 | Sasiya Khongkarian | 
| 5 | 6831503076 | Sutimon Budchadee | 



---

## Features & Scope

### Public Users (Visitors - No Login Required)
- **Search & Browse Brands:** Search dental implant brands by name with visual logos.
- **View & Filter Models:** Explore and search implant models under each specific brand.
- **Detailed Product Specifications:** View detailed specifications (Material, Type, Surface Treatment, Connection Type, Country of Origin) along with available diameters ($\varnothing$) and lengths.
- **Contact Admin:** Quick pop-up to copy or send emails directly to system administrators.

### Administrator System (Login Required)
- **Authentication:** Secure Admin login/logout mechanism using hashed passwords.
- **Implant Data Management (CRUD):**
  - **Add New Implant:** Add models with custom image URLs, specifications, and sizes, with duplicate validation.
  - **Edit Implant:** Update existing implant details, materials, and size tags ($\varnothing \times \text{length}$).
  - **Delete Record:** Delete implant records after double-confirmation.
  - **Toggle Visibility:** Hide or show specific implants without permanently deleting them.
- **Admin Profile Management:** Edit admin details (Name, Username, Email), change password, and select avatars.
- **Public Preview:** Preview the public site as a general user while maintaining admin access.

---

## Entity Overview & Architecture
The database structure consists of the following core entities:
- **`BRAND`**: Represents implant manufacturers/brands (Name, Country, Logo URL).
- **`MATERIAL`**: Lookup table for titanium/alloy materials.
- **`ADMIN`**: Stores administrator user credentials and profiles.
- **`IMPLANT_MODEL`**: Stores core product line specifications, image URLs, and visibility status.
- **`IMPLANT_SIZE`**: Maps diameter ($\varnothing$) and length combinations to specific implant models.