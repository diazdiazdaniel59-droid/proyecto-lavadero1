@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ============================================
echo  SUBIR PROYECTO A GITHUB (obligatorio)
echo ============================================
echo.

where git >nul 2>&1
if errorlevel 1 (
  echo ERROR: Git no esta instalado.
  echo Instalalo desde https://git-scm.com/download/win
  pause
  exit /b 1
)

echo Archivos que se subiran:
git status -s
echo.

set /p CONFIRM=¿Hacer commit y mostrar comando push? (S/N): 
if /i not "%CONFIRM%"=="S" exit /b 0

git add .
git commit -m "fix: build Vercel con dist e index.html"
git branch -M main

echo.
echo ============================================
echo  AHORA ejecuta esto (cambia TU_USUARIO y TU_REPO):
echo.
echo  git remote add origin https://github.com/TU_USUARIO/TU_REPO.git
echo  git push -u origin main
echo.
echo  Si ya tienes remote:
echo  git push -u origin main
echo ============================================
pause
