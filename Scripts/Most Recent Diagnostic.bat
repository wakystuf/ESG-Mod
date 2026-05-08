@echo off
setlocal enabledelayedexpansion

set "folder=%USERPROFILE%\Documents\Endless Space 2\Temporary Files"

for /f "delims=" %%F in ('dir "%folder%\*.html" /b /a-d /o-d') do (
    set "latest=%%F"
    goto :found
)

echo No HTML files found.
pause
exit /b

:found
explorer "%folder%\!latest!"