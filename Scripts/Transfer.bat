@echo off
setlocal

REM === Define paths ===
set "DOCS=%USERPROFILE%\Documents"
set "TARGET=%DOCS%\Endless Space 2\Community\Endless Space Competitive Mod"
set "SOURCE=%~dp0..\Endless Space Competitive Mod"

REM === Delete existing mod folder ===
if exist "%TARGET%" (
    echo Deleting existing mod folder...
    rmdir /s /q "%TARGET%"
)

REM === Copy new mod folder ===
echo Copying mod folder...
robocopy "%SOURCE%" "%TARGET%" /e ^
    /xd ".vs" "Schemas" ".git" ^
    /xf ".DS_Store" ^
    /r:1 /w:1

endlocal