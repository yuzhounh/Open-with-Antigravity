@echo off
:: Batch script to add Antigravity to Windows context menu
:: User-level installation - No Administrator privileges required

echo Installing Antigravity context menu (user-level, no admin required)...
echo.

:: Get the path to Antigravity.exe
set "ANTIGRAVITY_PATH=%LOCALAPPDATA%\Programs\Antigravity\Antigravity.exe"

:: Check if Antigravity is installed
if not exist "%ANTIGRAVITY_PATH%" (
    echo [ERROR] Antigravity.exe not found at: %ANTIGRAVITY_PATH%
    echo Please ensure Antigravity editor is properly installed.
    pause
    exit /b 1
)

:: Detect system language
for /f "tokens=3" %%a in ('reg query "HKCU\Control Panel\International" /v LocaleName 2^>nul ^| find "LocaleName"') do set LOCALE=%%a

if "%LOCALE:~0,2%"=="zh" (
    set "MENU_TEXT=通过 Antigravity 打开"
) else (
    set "MENU_TEXT=Open with Antigravity"
)

:: Add context menu for files
echo Adding context menu for files...
reg add "HKCU\Software\Classes\*\shell\Antigravity" /ve /d "%MENU_TEXT%" /f >nul 2>&1
reg add "HKCU\Software\Classes\*\shell\Antigravity" /v "Icon" /d "%ANTIGRAVITY_PATH%" /f >nul 2>&1
reg add "HKCU\Software\Classes\*\shell\Antigravity\command" /ve /d "\"%ANTIGRAVITY_PATH%\" \"%%1\"" /f >nul 2>&1
if %errorLevel% equ 0 (
    echo [OK] Successfully added context menu for files
) else (
    echo [ERROR] Failed to add context menu for files
)

:: Add context menu for folders
echo Adding context menu for folders...
reg add "HKCU\Software\Classes\Directory\shell\Antigravity" /ve /d "%MENU_TEXT%" /f >nul 2>&1
reg add "HKCU\Software\Classes\Directory\shell\Antigravity" /v "Icon" /d "%ANTIGRAVITY_PATH%" /f >nul 2>&1
reg add "HKCU\Software\Classes\Directory\shell\Antigravity\command" /ve /d "\"%ANTIGRAVITY_PATH%\" \"%%V\"" /f >nul 2>&1
if %errorLevel% equ 0 (
    echo [OK] Successfully added context menu for folders
) else (
    echo [ERROR] Failed to add context menu for folders
)

:: Add context menu for folder background
echo Adding context menu for folder background...
reg add "HKCU\Software\Classes\Directory\Background\shell\Antigravity" /ve /d "%MENU_TEXT%" /f >nul 2>&1
reg add "HKCU\Software\Classes\Directory\Background\shell\Antigravity" /v "Icon" /d "%ANTIGRAVITY_PATH%" /f >nul 2>&1
reg add "HKCU\Software\Classes\Directory\Background\shell\Antigravity\command" /ve /d "\"%ANTIGRAVITY_PATH%\" \"%%V\"" /f >nul 2>&1
if %errorLevel% equ 0 (
    echo [OK] Successfully added context menu for folder background
) else (
    echo [ERROR] Failed to add context menu for folder background
)

echo.
echo Installation completed successfully!
echo Please restart File Explorer or log out and log back in to Windows for changes to take effect.
echo.
pause
