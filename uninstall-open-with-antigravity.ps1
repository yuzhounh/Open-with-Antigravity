# PowerShell script to remove Antigravity from Windows context menu
# User-level uninstallation - No Administrator privileges required

Write-Host "Uninstalling Antigravity context menu (user-level, no admin required)..." -ForegroundColor Green
Write-Host ""

# Function to remove registry entries
function Remove-AntigravityMenu {
    param (
        [string]$KeyPath
    )
    
    try {
        # Use HKEY_CURRENT_USER instead of HKEY_CLASSES_ROOT (no admin required)
        $fullPath = "HKCU:\Software\Classes\$KeyPath\Antigravity"
        
        if (Test-Path $fullPath) {
            Remove-Item -Path $fullPath -Recurse -Force
            Write-Host "✓ Successfully removed Antigravity menu from $KeyPath" -ForegroundColor Green
        } else {
            Write-Host "○ Antigravity menu not found in $KeyPath (already removed)" -ForegroundColor Gray
        }
    }
    catch {
        Write-Error "Failed to remove Antigravity menu from $KeyPath : $_"
    }
}

# Remove context menu for files
Remove-AntigravityMenu -KeyPath "*\shell"

# Remove context menu for folders
Remove-AntigravityMenu -KeyPath "Directory\shell"

# Remove context menu for folder background
Remove-AntigravityMenu -KeyPath "Directory\Background\shell"

Write-Host "`n✓ Uninstallation completed successfully!" -ForegroundColor Green
Write-Host "  Please restart File Explorer or log out and log back in to Windows for changes to take effect." -ForegroundColor Yellow
Read-Host "`nPress Enter to exit"
