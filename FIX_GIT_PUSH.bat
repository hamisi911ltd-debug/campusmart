@echo off
echo ═══════════════════════════════════════════════════════════════
echo   FIX GITHUB PUSH TIMEOUT
echo ═══════════════════════════════════════════════════════════════
echo.
echo The push failed due to timeout. Let's fix it!
echo.
pause

echo.
echo Increasing Git buffer and timeout...
git config --global http.postBuffer 524288000
git config --global http.lowSpeedLimit 0
git config --global http.lowSpeedTime 999999

echo.
echo ✅ Git configuration updated
echo.
echo Now trying to push again...
echo.

git push -u origin main

if errorlevel 1 (
    echo.
    echo ❌ Push still failed. Try these alternatives:
    echo.
    echo OPTION 1: Push without node_modules
    echo   1. Add node_modules to .gitignore
    echo   2. git rm -r --cached node_modules
    echo   3. git commit -m "Remove node_modules"
    echo   4. git push
    echo.
    echo OPTION 2: Use Railway CLI instead
    echo   1. Skip GitHub push
    echo   2. Run: DEPLOY_RAILWAY.bat
    echo   3. Deploy directly with Railway CLI
    echo.
    echo OPTION 3: Deploy to Firebase instead
    echo   1. No GitHub needed
    echo   2. Run: FINAL_DEPLOY.bat
    echo   3. Deploy directly to Firebase
    echo.
    pause
    exit /b 1
)

echo.
echo ✅ Push successful!
echo.
echo Now deploy from Railway dashboard:
echo   1. Go to https://railway.app/dashboard
echo   2. Click "New Project"
echo   3. Select "Deploy from GitHub repo"
echo   4. Choose your repository
echo.
pause
