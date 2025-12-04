# PowerShell script to add Antigravity to Windows context menu
# User-level installation - No Administrator privileges required

# Get the path to Antigravity.exe
$antigravityPath = "$env:LOCALAPPDATA\Programs\Antigravity\Antigravity.exe"

# Check if Antigravity is installed
if (-not (Test-Path $antigravityPath)) {
    Write-Error "Antigravity.exe not found at: $antigravityPath"
    Write-Host "Please ensure Antigravity editor is properly installed." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit
}

# Detect system language for menu text
$culture = Get-Culture
if ($culture.Name -like "zh-*") {
    $menuText = "通过 Antigravity 打开"
} else {
    $menuText = "Open with Antigravity"
}

Write-Host "Installing Antigravity context menu (user-level, no admin required)..." -ForegroundColor Green
Write-Host ""

# Function to add registry entries
function Add-AntigravityMenu {
    param (
        [string]$KeyPath,
        [string]$Param
    )
    
    try {
        # Use HKEY_CURRENT_USER instead of HKEY_CLASSES_ROOT (no admin required)
        $fullPath = "HKCU:\Software\Classes\$KeyPath"
        
        # Create main key
        New-Item -Path "$fullPath\Antigravity" -Force | Out-Null
        Set-ItemProperty -Path "$fullPath\Antigravity" -Name "(Default)" -Value $menuText
        Set-ItemProperty -Path "$fullPath\Antigravity" -Name "Icon" -Value $antigravityPath
        
        # Create command subkey
        New-Item -Path "$fullPath\Antigravity\command" -Force | Out-Null
        Set-ItemProperty -Path "$fullPath\Antigravity\command" -Name "(Default)" -Value "`"$antigravityPath`" `"$Param`""
        
        Write-Host "✓ Successfully added Antigravity menu to $KeyPath" -ForegroundColor Green
    }
    catch {
        Write-Error "Failed to add Antigravity menu to $KeyPath : $_"
    }
}

# Add context menu for files
Add-AntigravityMenu -KeyPath "*\shell" -Param "%1"

# Add context menu for folders
Add-AntigravityMenu -KeyPath "Directory\shell" -Param "%V"

# Add context menu for folder background
Add-AntigravityMenu -KeyPath "Directory\Background\shell" -Param "%V"

Write-Host "`n✓ Installation completed successfully!" -ForegroundColor Green
Write-Host "  Please restart File Explorer or log out and log back in to Windows for changes to take effect." -ForegroundColor Yellow
Read-Host "`nPress Enter to exit"
