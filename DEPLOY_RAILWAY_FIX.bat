@echo off
echo ═══════════════════════════════════════════════════════════════
echo   DEPLOY SSL FIX TO RAILWAY
echo ═══════════════════════════════════════════════════════════════
echo.

echo Checking if Railway CLI is installed...
where railway >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ❌ Railway CLI not found!
    echo.
    echo Installing Railway CLI...
    npm install -g @railway/cli
    if %errorlevel% neq 0 (
        echo.
        echo ❌ Failed to install Railway CLI
        echo.
        echo Please install manually:
        echo   npm install -g @railway/cli
        echo.
        echo Or try alternative methods in FIX_RAILWAY_SSL_NOW.txt
        pause
        exit /b 1
    )
)

echo ✅ Railway CLI found
echo.

echo Logging in to Railway...
echo (Browser will open for authentication)
railway login
if %errorlevel% neq 0 (
    echo.
    echo ❌ Login failed
    pause
    exit /b 1
)

echo.
echo ✅ Logged in successfully
echo.

cd backend
echo Linking to Railway project...
echo (Select: campusmart project → campusmart service)
railway link
if %errorlevel% neq 0 (
    echo.
    echo ❌ Failed to link project
    cd ..
    pause
    exit /b 1
)

echo.
echo ✅ Project linked
echo.

echo Deploying updated code to Railway...
railway up
if %errorlevel% neq 0 (
    echo.
    echo ❌ Deployment failed
    cd ..
    pause
    exit /b 1
)

echo.
echo ✅ Deployment successful!
echo.

echo Checking deployment logs...
timeout /t 5 /nobreak >nul
railway logs --lines 30

cd ..

echo.
echo ═══════════════════════════════════════════════════════════════
echo   DEPLOYMENT COMPLETE!
echo ═══════════════════════════════════════════════════════════════
echo.
echo Next steps:
echo   1. Check logs above for "Database schema verified"
echo   2. Test your app: https://campusmart-7d3d4.web.app
echo   3. Try to register/login
echo.
echo If still having issues:
echo   • Read: RAILWAY_ADD_SSL_VARIABLE.txt (add env variables)
echo   • Or: DEPLOY_FULL_FIREBASE_NOW.txt (switch to Firebase)
echo.
pause
