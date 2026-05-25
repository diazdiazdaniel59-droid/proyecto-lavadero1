@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ============================================
echo  SUBIR A GITHUB
echo ============================================
echo.

where git >nul 2>&1
if errorlevel 1 (
  echo ERROR: Instala Git desde https://git-scm.com/download/win
  pause
  exit /b 1
)

echo 1. Crear repo en GitHub (solo la primera vez):
echo    https://github.com/new
echo    Repo: diazdiazdaniel59-droid/proyecto-lavadero1
echo    NO marques "Add a README"
echo.
echo 2. Luego pulsa una tecla para hacer PUSH...
pause >nul

git branch -M main
git remote remove origin 2>nul
git remote add origin https://github.com/diazdiazdaniel59-droid/proyecto-lavadero1.git

echo.
echo Subiendo a GitHub...
git push -u origin main

if errorlevel 1 (
  echo.
  echo ERROR en el push. Prueba:
  echo   - Crear el repo en github.com/new
  echo   - Iniciar sesion: gh auth login
  echo   - O usar GitHub Desktop
) else (
  echo.
  echo LISTO. Codigo subido a GitHub.
)

pause
