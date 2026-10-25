# Campus Career Connect — Student Placement Management System

A Java 17 + Spring Boot web application for college placement activities. The application uses Thymeleaf for the UI, Spring Security for authentication/roles, Spring Data JPA for persistence, and H2 for a simple local setup. MySQL is supported for deployment.

## Requirements

- JDK 17 or newer
- Apache Maven 3.8+ (VS Code extension: **Extension Pack for Java** is recommended)
- Git (for GitHub)

## Run in VS Code (Windows)

1. Extract this ZIP and open the **project root** in VS Code — the folder containing `pom.xml`.
2. Install JDK 17+ and Maven. Open a new VS Code terminal and verify:
   ```powershell
   java -version
   mvn -version
   ```
3. Set a strong initial placement-officer password in the terminal. This account is created only when the database is first initialized:
   ```powershell
   $env:INITIAL_ADMIN_EMAIL="officer@driems.ac.in"
   $env:INITIAL_ADMIN_PASSWORD="Choose-A-Strong-Password"
   ```
4. Start the app:
   ```powershell
   mvn spring-boot:run
   ```
5. Open http://localhost:3000 in your browser. Sign in with the configured email and password.

On macOS/Linux, set the variables before running:
```bash
export INITIAL_ADMIN_EMAIL='officer@driems.ac.in'
export INITIAL_ADMIN_PASSWORD='Choose-A-Strong-Password'
mvn spring-boot:run
```

The default `dev` profile uses a local H2 file database in `./data/placement_db`, so records persist across restarts. Do not delete the `data/` folder if you want to keep local data. The H2 console is available at http://localhost:3000/h2-console for local development only.

### If you already ran the app without setting the admin password

The database will have been initialized without an officer account. Stop the app, back up and remove the local H2 files in `data/`, then set `INITIAL_ADMIN_PASSWORD` and start again. **This deletes the local database and all its records.** Do not do this if you need to preserve data.

## Run tests and create a JAR

```bash
mvn test
mvn clean package
java -jar target/student-placement-management-system-1.0.0.jar
```

## GitHub

1. Create an empty repository on GitHub.
2. In the project root terminal:
   ```bash
   git init
   git add .
   git commit -m "Prepare Campus Career Connect for VS Code and GitHub"
   git branch -M main
   git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git
   git push -u origin main
   ```
3. GitHub Actions runs the Maven build and tests on pushes and pull requests. **GitHub stores the code and runs CI; it does not automatically host this web application.** To make the app publicly accessible, deploy the included Dockerfile to a Java/Docker hosting provider and configure a persistent MySQL database.

## MySQL / deployment configuration

Set `SPRING_PROFILES_ACTIVE=mysql` and provide:
- `DB_URL` (optional full JDBC URL)
- `DB_HOST`
- `DB_PORT`
- `DB_NAME`
- `DB_USERNAME`
- `DB_PASSWORD`
- `INITIAL_ADMIN_EMAIL`
- `INITIAL_ADMIN_PASSWORD`
- `PORT` (the host's assigned port; defaults to 3000)

Never commit real passwords, API keys, or database credentials. Use your hosting provider's environment-variable/secrets settings. Use a managed database with persistent storage in production; the local H2 file is intended for development.

## Project structure

- `src/main/java` — Spring Boot application, controllers, services, repositories, entities and security
- `src/main/resources/templates` — Thymeleaf pages
- `src/main/resources/static` — CSS and static assets
- `src/main/resources/application*.properties` — environment/profile configuration
- `src/test/java` — automated tests
- `.github/workflows/ci.yml` — GitHub Actions build and test
- `Dockerfile` — container build for hosting

## Notes

- Sample company/job content is initialized by `DataInitializer` when the database is empty. Review and replace sample entries before using this system for real college placement activities.
- Existing accounts/data are not reset automatically when the database already contains records.
