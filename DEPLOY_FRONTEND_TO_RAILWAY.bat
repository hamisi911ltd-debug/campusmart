@echo off
color 0A
echo.
echo ═══════════════════════════════════════════════════════════════
echo   DEPLOY FRONTEND WITH RAILWAY BACKEND
echo ═══════════════════════════════════════════════════════════════
echo.
echo Railway Backend: https://campusmart-production.up.railway.app
echo Firebase Frontend: https://campusmart-7d3d4.web.app
echo.
echo ═══════════════════════════════════════════════════════════════
pause

echo.
echo ═══════════════════════════════════════════════════════════════
echo   STEP 1: Rebuild Frontend
echo ═══════════════════════════════════════════════════════════════
echo.

cd frontend
call npm run build

if errorlevel 1 (
    echo.
    echo ❌ Build failed!
    cd ..
    pause
    exit /b 1
)

echo ✅ Frontend built successfully
cd ..

echo.
echo ═══════════════════════════════════════════════════════════════
echo   STEP 2: Deploy to Firebase
echo ═══════════════════════════════════════════════════════════════
echo.

firebase deploy --only hosting

if errorlevel 1 (
    echo.
    echo ❌ Deployment failed!
    pause
    exit /b 1
)

echo.
echo ═══════════════════════════════════════════════════════════════
echo   🎉 DEPLOYMENT COMPLETE!
echo ═══════════════════════════════════════════════════════════════
echo.
echo Your app is now live:
echo   • Frontend: https://campusmart-7d3d4.web.app
echo   • Backend: https://campusmart-production.up.railway.app
echo   • Database: Railway PostgreSQL
echo.
echo Test your app:
echo   1. Visit: https://campusmart-7d3d4.web.app
echo   2. Register a new account
echo   3. Login and test features
echo.
echo ═══════════════════════════════════════════════════════════════
pause
