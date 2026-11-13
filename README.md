
# Dental Implant Database Management System
---

## Project Overview
Currently, information regarding dental implants available in Thailand is scattered across multiple websites belonging to various manufacturers and importers. Consequently, dentists, medical personnel, and the general public face difficulty in searching and accessing complete product specifications efficiently.

The **Dental Implant Database Management System** is a web-based dental implant database management system developed using Spring Boot. The system helps administrators manage dental implant information, including brands, implant models, materials, and implant sizes. It provides an interface for viewing and managing implant data, making it easier to organize and maintain dental implant records.

The project uses Spring Boot, Spring Data JPA, Thymeleaf, and a relational database to manage and display information.

---

## Technologies Used

| Technology | Purpose |
| :--- | :--- |
| **Java 17** | Main programming language |
| **Spring Boot 3.2.0** | Backend application framework |
| **Spring Web** | Handles web requests and controllers |
| **Spring Data JPA** | Database operations |
| **Thymeleaf** | Frontend page rendering |
| **H2 Database** | Local development database |
| **Maven** | Dependency management and project building |
| **BCrypt** | Administrator password hashing |
| **HTML, CSS, JavaScript** | Frontend design and interaction |

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
## Main Features

- Administrator login and logout.
- Administrator profile management.
- Dental implant brand management.
- Dental implant model management.
- Implant material information management.
- Implant size management.
- Adding, viewing, editing, and deleting relevant records.
- Enabling and disabling implant model and size availability.
- Database management using Spring Data JPA.
- Secure administrator password storage using BCrypt.

---

## Requirements Before Running the Project

Please install the following software before running the application:

- Java JDK 17 or later compatible with the project.
- Apache Maven.
- Git.
- A web browser such as Google Chrome.

You can check whether Java and Maven are installed by running:

```bash
java -version
mvn -version
```

---

## Entity Overview & Architecture
The application uses a relational database managed through Spring Data JPA.

The project contains five main entity classes:
1. **Admin** - Stores administrator account information.
2. **Brand** - Stores dental implant brand information.
3. **ImplantModel** - Stores information about dental implant models.
4. **ImplantSize** - Stores available sizes associated with implant models.
5. **Material** - Stores dental implant material information.

For local development, the project uses the H2 database. Sample data is loaded from `data.sql` when the `Brand` table is empty.

---
## How to Run the Project

Follow these steps to run Implant Finder on your computer.

### Step 1: Clone the GitHub Repository
Open a terminal and run:

```bash
git clone [https://github.com/6831503016-ops/Implant-Finder.git](https://github.com/6831503016-ops/Implant-Finder.git)
```

*(Replace `YOUR_GITHUB_REPOSITORY_URL` with the actual GitHub repository URL if cloning from a different fork/repository.)*

### Step 2: Open the Project Folder
Navigate into the project directory:

```bash
cd Implant-Finder
```

Make sure you are in the main project directory where the `pom.xml` file is located.

### Step 3: Configure the Initial Administrator Password
Before running the application for the first time, configure an initial administrator password.

**For macOS or Linux:**
```bash
export APP_ADMIN_PASSWORD='YourStrongPassword123!'
```

**For Windows PowerShell:**
```powershell
$env:APP_ADMIN_PASSWORD="YourStrongPassword123!"
```

Replace the example password with your own password. The application uses this password to create the initial administrator account if one does not already exist. The password is automatically hashed using BCrypt before being stored in the database.

> **Important:** Do not upload real passwords or other private credentials to GitHub.

### Step 4: Run the Application
From the project root directory, run:

```bash
mvn spring-boot:run
```

Maven will download the required dependencies, compile the project, and start the Spring Boot application. Wait until the terminal indicates that the application has started successfully.

### Step 5: Open the Application
Open your web browser and visit:

- **Main Application:** http://localhost:8080
- **Administrator Login:** http://localhost:8080/admin/login

The application uses port `8080` by default.

### Step 6: Test Administrator Login
Use the following information to access the administrator login page:

| Login Field | Information |
| :--- | :--- |
| **Email** | `admin@implant.com` |
| **Username** | `@implantadmin` |
| **Password** | The password configured in Step 3 |

> **Note:** The initial administrator account is created only if an account with the configured administrator email or username does not already exist. If an administrator account already exists, use its existing password.

### Step 7: Stop the Application
To stop the application, return to the terminal and press:

```text
Ctrl + C
```

---
## Security Information

- The project uses BCrypt password hashing to protect administrator passwords.
- Administrator passwords are hashed before being stored in the database.
- The initial administrator password is provided through an environment variable.
- Private passwords and credentials should not be committed to the GitHub repository.
- Database credentials should be configured separately when connecting to an external database.

---
## Repository Structure

The main project structure is organized as follows:

```text
Implant-Finder/
├── pom.xml
├── README.md
└── src/
    └── main/
        ├── java/
        │   └── th/
        │       └── mfu/
        │           ├── config/
        │           ├── controller/
        │           ├── domain/
        │           ├── repository/
        │           └── DataSeeder.java
        └── resources/
            ├── application.properties
            ├── data.sql
            ├── templates/
            └── public/
```

---
## Team Responsibilities

Each group member contributed to the development of the project:

| Name | Student ID | Responsibilities |
| :--- | :--- | :--- |
| **Saung Pan Nwe** | 6831503016 | Set up the initial project structure and file organization. Contributed to user interface improvements and design adjustments. Developed and maintained some of the application controller logic. Refactored the database structure into five main relational entity classes. Fixed UI issues, solved application errors, and improved overall functionality. |
| **Sutimon Budchadee** | 6831503076 | Developed the core UI templates and navigation components, customized the Admin Login and Profile layouts, and implemented Admin data-addition and brand logo upload features. Managed code integration via Git Pull Requests, authored the project README documentation, and deployed the database to Cloud SQL. |
| **Sasiya Khongkarian**<br>**Kritsaya Ketsin** | 6831503071<br>6831503032 | Developed and improved the user interface of the homepage and brand/model pages. Organized CSS and JavaScript files, adjusted page layouts and visual elements, and implemented hover effects for buttons to enhance the overall user experience. Resolved Admin login errors and public page bugs, and implemented a "Back to Admin" button for the user-view mode. Created the `edit-model.html` template, added edit icons in `data-management.html`, and built a unified "Contact Admin" pop-up modal using a shared admin email configuration. Enhanced overall UI/UX by redesigning the Admin Management, Edit Profile, and Edit Models pages, adding custom avatars, fixing search bar and profile routing issues, adjusting colors and navigation, and hiding the browser's built-in password reveal icon. |
| **Raksasinee Chobchonchai** | 6831503066 | Added implant images to every implant models, moved the breadcrumb UI next to the back arrow and fixed its arrow, added and updated the paginator in the Implant Data Management table, configured new models to appear first in the rows of the table, made hidden models button hide the models, fixed the error layout in avatar page, and added a delete modal dialog box. |

---
## Notes

- The default local development database is H2.
- The application runs on port `8080` unless another port is configured.
- The initial administrator password must be configured when a new administrator account needs to be created.
- The project requires Java 17 and Maven to run.
- Do not commit passwords, API keys, database credentials, or other sensitive information to GitHub.

---

- **Project Name:** Implant Finder
- **Project Type:** Dental Implant Database Management System
- **Framework:** Spring Boot
- **Java Version:** 17