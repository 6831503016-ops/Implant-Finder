# Implant-Finder
DENTAL IMPLANT DATABASE MAGNAGEMENT
# 🦷 Dental Implant Database Management System
---

## 📌 Project Overview
Currently, information regarding dental implants available in Thailand is scattered across multiple websites belonging to various manufacturers and importers[cite: 4]. Consequently, dentists, medical personnel, and the general public face difficulty in searching and accessing complete product specifications efficiently[cite: 4].

The **Dental Implant Database Management System** is a standalone web-based platform designed to centralize comprehensive information on various dental implant brands, models, sizes, and specifications available in Thailand into a single place[cite: 4, 6].

---

## 🎯 Business Objectives & Vision
1. **Centralize Information:** Aggregate dental implant data (brands, models, dimensions, materials) across Thailand into a single platform[cite: 4].
2. **Convenient Public Access:** Allow general users and medical staff to conveniently search and access detailed dental implant specifications[cite: 4].
3. **Data Management System:** Provide an administrative management system to add, edit, delete, and control the visibility of implant records to maintain data accuracy and up-to-date information[cite: 4].

---

## 👥 Team Members (Group 4)

| No. | Student ID | Name | 
|---|---|---|---|
| 1 | 6831503016 | Saung Pan Nwe | 
| 2 | 6831503032 | Kritsaya Ketsin | 
| 3 | 6831503066 | Raksasinee Chobchonchai | 
| 4 | 6831503071 | Sasiya Khongkarian | 
| 5 | 6831503076 | Sutimon Budchadee | 



---

## 🛠 Features & Scope

### 🌐 Public Users (Visitors - No Login Required)
- **Search & Browse Brands:** Search dental implant brands by name with visual logos[cite: 4, 6, 8].
- **View & Filter Models:** Explore and search implant models under each specific brand[cite: 4, 6, 9].
- **Detailed Product Specifications:** View detailed specifications (Material, Type, Surface Treatment, Connection Type, Country of Origin) along with available diameters ($\varnothing$) and lengths[cite: 6, 9].
- **Contact Admin:** Quick pop-up to copy or send emails directly to system administrators[cite: 6, 13].

### 🔒 Administrator System (Login Required)
- **Authentication:** Secure Admin login/logout mechanism using hashed passwords[cite: 4, 6, 14].
- **Implant Data Management (CRUD):**
  - **Add New Implant:** Add models with custom image URLs, specifications, and sizes, with duplicate validation[cite: 6, 10].
  - **Edit Implant:** Update existing implant details, materials, and size tags ($\varnothing \times \text{length}$)[cite: 6, 11].
  - **Delete Record:** Delete implant records after double-confirmation[cite: 6, 11, 14].
  - **Toggle Visibility:** Hide or show specific implants without permanently deleting them[cite: 6, 12].
- **Admin Profile Management:** Edit admin details (Name, Username, Email), change password, and select avatars[cite: 6, 12].
- **Public Preview:** Preview the public site as a general user while maintaining admin access[cite: 6, 13].

---

## 🗄 Entity Overview & Architecture

The database structure consists of the following core entities[cite: 25, 28]:
- **`BRAND`**: Represents implant manufacturers/brands (Name, Country, Logo URL)[cite: 25, 26].
- **`MATERIAL`**: Lookup table for titanium/alloy materials[cite: 25, 26].
- **`ADMIN`**: Stores administrator user credentials and profiles[cite: 25, 27].
- **`IMPLANT_MODEL`**: Stores core product line specifications, image URLs, and visibility status[cite: 25, 27].
- **`IMPLANT_SIZE`**: Maps diameter ($\varnothing$) and length combinations to specific implant models[cite: 25, 28].