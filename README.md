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
## How to Run the Project (Local Database)

Follow these steps to run Implant Finder on your computer.

### Step 1: Clone the GitHub Repository
Open a terminal and run:

```bash
git clone https://github.com/6831503016-ops/Implant-Finder.git
```

### Step 2: Open the Project Folder
Navigate into the project directory:

```bash
cd Implant-Finder
```

Make sure you are in the main project directory where the `pom.xml` file is located.

### Step 3 (Optional): Choose an Administrator Password
When you run the project locally (Step 4), it uses its own local H2 database, and the administrator account is created automatically with the demo password **`admin1234`**.

To use your own password instead, set it before Step 4:

**For macOS or Linux:**
```bash
export APP_ADMIN_PASSWORD='YourStrongPassword123!'
```

**For Windows PowerShell:**
```powershell
$env:APP_ADMIN_PASSWORD="YourStrongPassword123!"
```

The password is hashed with BCrypt before it is stored in the database.

> **Important:** Do not upload real passwords or other private credentials to GitHub.

### Step 4: Run the Application (Local Database)
From the project root directory, run:

**For macOS, Linux or Windows Command Prompt:**
```bash
mvn spring-boot:run -Dspring-boot.run.profiles=local
```

**For Windows PowerShell:**
```powershell
mvn spring-boot:run "-Dspring-boot.run.profiles=local"
```

Maven will download the required dependencies, compile the project, and start the Spring Boot application. Wait until the terminal shows `Started App`.

The `local` profile (`application-local.properties`) runs the project with a local H2 database stored in the `data/` folder, so **no Google Cloud account or Cloud SQL access is needed**. On the first run, sample brands, materials, implant models and sizes are loaded automatically from `data.sql`.

> **Note:** Running `mvn spring-boot:run` *without* `-Dspring-boot.run.profiles=local` connects to the group's Google Cloud SQL database, which requires Google Cloud credentials. That mode is used for the deployed website on Cloud Run.

To start again with a fresh database, stop the application and delete the `data/` folder.

To look inside the local database, open http://localhost:8080/h2-console and use JDBC URL `jdbc:h2:file:./data/implantdb`, user `sa`, and an empty password.

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
| **Password** | `123456`, or the password you set in Step 3 |

> **Note:** The initial administrator account is created only if an account with the configured administrator email or username does not already exist. If an administrator account already exists, use its existing password.

### Step 7: Stop the Application
To stop the application, return to the terminal and press:

```text
Ctrl + C
```

---
## Running the Project as a Contributor 

### 1. Open the project
Choose one of these:

- **GitHub Codespaces (no installation needed):** On the repository page, click **Code** → **Codespaces** → **Create codespace on main** (or open your existing codespace). Wait until the terminal shows `/workspaces/Implant-Finder`.

### 2. Run and test with the local database
```bash
mvn spring-boot:run -Dspring-boot.run.profiles=local
```
- In Codespaces, open the **PORTS** tab and click the globe icon next to port **8080** to open the website.
- Log in at `/admin/login` with `admin@implant.com` and `admin1234` (or the password you set with `APP_ADMIN_PASSWORD`).
- The local profile uses its own H2 database, so you can add, edit and delete test data **without changing the real website's data**.
- After changing Java code, stop the app with `Ctrl + C` and run the command again. After changing HTML, CSS or JavaScript, refresh the browser with `Ctrl + F5`.



---
## Running the Project with the Cloud SQL Database

Use this mode only when you need to work with the **real data** used by the deployed website.

> **Warning:** In this mode, anything you add, edit or delete changes the live database used by the website on Cloud Run. Use the local database (above) for testing.

### Requirements
- Access to the group's Google Cloud project **My Project 9173** (project ID `sonorous-mix-511409-k3`) with at least the **Cloud SQL Client** role. Ask the project owner to add your Google account in **IAM & Admin → IAM** if you do not have access.
- The database password for the user `implant_admin`. Get it **privately** from the team. Never write it in the code, README or chat groups.

The Cloud SQL connection details are already configured in `application.properties`:

| Setting | Value |
| :--- | :--- |
| Instance | `free-trial-first-project` (region `asia-southeast1`) |
| Database | `implant_finder` |
| User | `implant_admin` |
| Password | read from the `DB_PASSWORD` environment variable |

### Step 1: Install the Google Cloud CLI
Skip this step if `gcloud --version` already shows a version number.

**Codespaces, macOS or Linux:**
```bash
curl -sSL https://sdk.cloud.google.com | bash -s -- --disable-prompts
echo 'source ~/google-cloud-sdk/path.bash.inc' >> ~/.bashrc
source ~/.bashrc
gcloud --version
```

**Windows:** Download and run the installer from https://cloud.google.com/sdk/docs/install, then open a new PowerShell window.

### Step 2: Sign in to Google Cloud for the application
```bash
gcloud auth application-default login
```
1. Open the link that appears and sign in with the Google account that has access to the project.
2. Allow all requested permissions.
3. Click **Copy** on the page and paste the code into the terminal **once**, then press Enter.
4. You should see `Credentials saved to file`. A warning about a quota project can be ignored.

### Step 3: Set the password environment variables
**Codespaces, macOS or Linux:**
```bash
export DB_PASSWORD='the-database-password'
export APP_ADMIN_PASSWORD='the-admin-password'
```
To keep them for new terminals in Codespaces, add them to `~/.bashrc` instead:
```bash
echo "export DB_PASSWORD='the-database-password'" >> ~/.bashrc
echo "export APP_ADMIN_PASSWORD='the-admin-password'" >> ~/.bashrc
source ~/.bashrc
```

**Windows PowerShell:**
```powershell
$env:DB_PASSWORD="the-database-password"
$env:APP_ADMIN_PASSWORD="the-admin-password"
```

> Type these commands yourself. Copying from chat apps can insert curly quotes (`” “`), which breaks the commands.

### Step 4: Run the application
```bash
mvn spring-boot:run
```
Do **not** add `-Dspring-boot.run.profiles=local`. Check the log:

- `No active profile set, falling back to 1 default profile: "default"` → using Cloud SQL ✅
- `HikariPool-1 - Added connection com.mysql.cj.jdbc.ConnectionImpl` → connected to the database ✅
- `Started App in ... seconds` → the website is ready at port 8080 ✅

### Step 5: View the data in Cloud SQL Studio
1. Open https://console.cloud.google.com/sql/instances?project=sonorous-mix-511409-k3
2. Click **free-trial-first-project** → **Cloud SQL Studio**.
3. Sign in with database `implant_finder`, user `implant_admin` and the database password.
4. Run a query, for example:
   ```sql
   SELECT * FROM brand ORDER BY brand_id DESC;
   ```

> On the instance page, do **not** click **Restart**, **Stop**, **Delete** or **Import sample data**.

### Troubleshooting (Cloud SQL mode)

| Error message | Cause | Fix |
| :--- | :--- | :--- |
| `Your default credentials were not found` | Not signed in to Google Cloud for the app | Do Step 2 again |
| `Access denied for user 'implant_admin'` | MySQL 8.4 password cache is empty (see note below) | Sign in once to **Cloud SQL Studio** (Step 5), then run Step 4 again |
| `403` / `NOT_AUTHORIZED` | Your Google account has no access to the project | Ask the project owner to give you the **Cloud SQL Client** role |
| `gcloud: command not found` | Google Cloud CLI not installed or not loaded | Do Step 1 again, or run `source ~/.bashrc` |
| `Malformed auth code` | The code was pasted incorrectly | Do Step 2 again; use the **Copy** button and paste once |
| `syntax error near unexpected token '&&'` | A command was split across lines | Type the whole command on one line |

> **Note about `Access denied`:** The Cloud SQL instance runs MySQL 8.4, which uses `caching_sha2_password` authentication. The Java connector cannot perform the first full password check by itself, so it relies on the server's password cache. Signing in once through Cloud SQL Studio fills that cache. The cache is cleared when the password is changed or the database restarts, so **do not run `gcloud sql users set-password`** unless the whole team agrees. Changing the password also requires updating the Cloud Run settings and every team member's `DB_PASSWORD`.

### Deploying the website to Cloud Run (project owners only)
After your changes are merged into `main`:
```bash
git checkout main
git pull
gcloud auth login
gcloud config set project sonorous-mix-511409-k3
gcloud run deploy implant-finder --source . --region=asia-southeast1 --allow-unauthenticated \
  --add-cloudsql-instances=sonorous-mix-511409-k3:asia-southeast1:free-trial-first-project \
  --set-env-vars=DB_PASSWORD=the-database-password,APP_ADMIN_PASSWORD=the-admin-password
```
The build takes about 5–10 minutes. When it finishes, the command prints the website's `Service URL`. To see the website's logs:
```bash
gcloud run services logs read implant-finder --region=asia-southeast1 --limit=50
```

> Files uploaded through the website on Cloud Run (such as new brand logos) are stored inside the running container and can be lost when Cloud Run restarts.

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
            ├── application.properties        # Cloud SQL settings (default)
            ├── application-local.properties  # Local H2 settings (local profile)
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