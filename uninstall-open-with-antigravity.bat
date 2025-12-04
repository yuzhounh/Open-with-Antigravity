@echo off
:: Batch script to remove Antigravity from Windows context menu
:: User-level uninstallation - No Administrator privileges required

echo Uninstalling Antigravity context menu (user-level, no admin required)...
echo.

:: Remove context menu for files
echo Removing context menu for files...
reg delete "HKCU\Software\Classes\*\shell\Antigravity" /f >nul 2>&1
if %errorLevel% equ 0 (
    echo [OK] Successfully removed context menu for files
) else (
    echo [INFO] Context menu for files not found or already removed
)

:: Remove context menu for folders
echo Removing context menu for folders...
reg delete "HKCU\Software\Classes\Directory\shell\Antigravity" /f >nul 2>&1
if %errorLevel% equ 0 (
    echo [OK] Successfully removed context menu for folders
) else (
    echo [INFO] Context menu for folders not found or already removed
)

:: Remove context menu for folder background
echo Removing context menu for folder background...
reg delete "HKCU\Software\Classes\Directory\Background\shell\Antigravity" /f >nul 2>&1
if %errorLevel% equ 0 (
    echo [OK] Successfully removed context menu for folder background
) else (
    echo [INFO] Context menu for folder background not found or already removed
)

echo.
echo Uninstallation completed successfully!
echo Please restart File Explorer or log out and log back in to Windows for changes to take effect.
echo.
pause
