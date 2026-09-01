@echo off
setlocal EnableExtensions

rem ============================================
rem  RuoYi-Vue-Pro One-Click Startup Script
rem  JDK 25 + MySQL 8.0 + Redis 3.x
rem  Active modules: system, infra, ai
rem ============================================

set "ROOT=%~dp0"
set "JAVA_HOME=C:\Program Files\Microsoft\jdk-25.0.4.101-hotspot"
set "PATH=%JAVA_HOME%\bin;%PATH%"
set "SERVER_JAR=%ROOT%yudao-server\target\yudao-server.jar"
set "FRONTEND_DIR=%ROOT%yudao-ui\yudao-ui-admin-vue3"
set "REDIS_CLI=C:\Program Files\Redis\redis-cli.exe"
set "MYSQL_BIN=C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"
set "MYSQL_PASS=123456"
set "DEEPSEEK_API_KEY=YOUR_DEEPSEEK_API_KEY"

echo.
echo ===== RuoYi-Vue-Pro Local Startup =====
echo.

rem --- Check JDK ---
if not exist "%JAVA_HOME%\bin\java.exe" (
    echo [ERROR] JDK not found: %JAVA_HOME%
    exit /b 1
)
echo [OK] JDK: %JAVA_HOME%

rem --- Check MySQL ---
"%MYSQL_BIN%" -u root -p%MYSQL_PASS% -D "ruoyi-vue-pro" -N -e "SELECT 1;" >nul 2>&1
if errorlevel 1 (
    echo [ERROR] MySQL connection failed. Check password or database.
    exit /b 1
)
echo [OK] MySQL: root@localhost, database: ruoyi-vue-pro

rem --- Check Redis ---
"%REDIS_CLI%" ping >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Redis is not running. Start Redis service first.
    exit /b 1
)
echo [OK] Redis: PONG

rem --- Check Jar ---
if not exist "%SERVER_JAR%" (
    echo [INFO] Jar not found, building...
    cd /d "%ROOT%"
    call mvn package -DskipTests -pl yudao-server -am -f pom.xml
    if errorlevel 1 (
        echo [ERROR] Build failed.
        pause
        exit /b 1
    )
)
echo [OK] Backend Jar ready

rem --- Start Backend ---
for /f "tokens=5" %%P in ('netstat -ano ^| findstr /r /c:":48080 .*LISTENING"') do set "BACKEND_PID=%%P"
if defined BACKEND_PID (
    echo [INFO] Backend port 48080 already in use by PID %BACKEND_PID%, skipping.
) else (
    echo [INFO] Starting backend...
    start "RuoYi Backend" /D "%ROOT%" powershell.exe -NoExit -NoProfile -ExecutionPolicy Bypass -Command "$env:DEEPSEEK_API_KEY='%DEEPSEEK_API_KEY%'; & '%JAVA_HOME%\bin\java.exe' -jar '%SERVER_JAR%'"
)

rem --- Start Frontend ---
if not exist "%FRONTEND_DIR%\node_modules" (
    echo [WARN] Frontend not installed. Run: pnpm install
    echo [INFO] Backend only mode.
) else (
    for /f "tokens=5" %%P in ('netstat -ano ^| findstr /r /c:":80 .*LISTENING"') do set "FRONTEND_PID=%%P"
    if defined FRONTEND_PID (
        echo [INFO] Frontend port 80 already in use by PID %FRONTEND_PID%, skipping.
    ) else (
        echo [INFO] Starting frontend...
        start "RuoYi Frontend" /D "%FRONTEND_DIR%" powershell.exe -NoExit -NoProfile -ExecutionPolicy Bypass -Command "npx vite --mode env.local"
    )
)

rem --- Wait for Backend Health ---
echo.
echo [CHECK] Waiting up to 180 seconds for backend...
powershell -NoProfile -Command "$deadline = (Get-Date).AddSeconds(180); do { try { $r = Invoke-WebRequest 'http://127.0.0.1:48080/admin-api/system/tenant/get-id-by-website?website=' -UseBasicParsing -TimeoutSec 2; if ($r.StatusCode -eq 200) { Write-Host '[OK] Backend is ready!'; exit 0 } } catch { }; Start-Sleep -Seconds 3 } while ((Get-Date) -lt $deadline); Write-Host '[ERROR] Backend startup timed out.'; exit 1"

echo.
echo ========================================
echo   Backend:  http://127.0.0.1:48080/swagger-ui
echo   Frontend: http://127.0.0.1:80
echo   Login:    admin / admin123
echo ========================================
echo.
pause
endlocal
