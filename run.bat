@echo off
setlocal
echo Starting Campus Career Connect...
where java >nul 2>nul || (echo ERROR: Install JDK 17+ and add java to PATH. & pause & exit /b 1)
where mvn >nul 2>nul || (echo ERROR: Install Maven 3.8+ and add mvn to PATH. & pause & exit /b 1)
if "%INITIAL_ADMIN_PASSWORD%"=="" (
  set /p INITIAL_ADMIN_PASSWORD=Enter a strong initial placement-officer password:
)
if "%INITIAL_ADMIN_EMAIL%"=="" set INITIAL_ADMIN_EMAIL=officer@driems.ac.in
mvn spring-boot:run
endlocal
