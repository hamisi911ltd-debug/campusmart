@echo off
echo ========================================
echo FINAL FIX: Regenerate package-lock.json
echo ========================================
echo.

cd backend

echo Step 1: Deleting old package-lock.json...
del package-lock.json

echo Step 2: Running npm install to regenerate...
call npm install

echo Step 3: Going back to root...
cd ..

echo Step 4: Adding to git...
git add backend/package-lock.json

echo Step 5: Committing...
git commit -m "Regenerate package-lock.json to fix Railway npm ci error"

echo Step 6: Pushing to GitHub...
git push origin main

echo.
echo ========================================
echo DONE! Railway will auto-deploy now.
echo ========================================
pause
