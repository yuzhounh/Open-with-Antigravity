# Open with Antigravity

> Add Antigravity to the Windows context menu with a per-user installation.

<p>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-f59e0b?style=flat" alt="License: MIT"></a>
  <img src="https://img.shields.io/badge/Platform-Windows-0078d4?style=flat" alt="Platform: Windows">
  <img src="https://img.shields.io/badge/PowerShell-Windows-5391fe?style=flat" alt="PowerShell: Windows">
</p>

<p>
  <a href="#installation-methods">Get started</a> · <a href="LICENSE">License</a> · <a href="README_zh-CN.md">中文说明</a>
</p>

This project adds Antigravity editor options to the Windows context menu for files, folders, and folder backgrounds by modifying the Windows registry.

## Features

- Adds "Open with Antigravity" option to the context menu for files, folders, and folder backgrounds
- Adds "通过 Antigravity 打开" option for Chinese language users
- No administrator privileges required
- User-specific installation (affects only current user)
- Uses current-user registry entries; availability on managed devices depends on local policies

## Installation Methods

All methods target Windows and require Antigravity to be installed first. Download or clone this repository before following the steps below. The Python installer looks for `%LOCALAPPDATA%\Programs\Antigravity\Antigravity.exe`; adjust the paths in your chosen installer if your installation differs.

This project provides **five different installation methods**. Choose the one that best suits your needs:

### Method 1: Registry Files (No Admin Required) ⭐ Recommended

**Advantages**: User-specific, no administrator privileges required, paths can be edited before import

1. **Modify Configuration**: Open the `.reg` file and replace every `<YourUsername>` with your Windows profile folder name. Check every executable path and preserve doubled backslashes when editing it.
2. **Install one variant**:
   - **English**: Double-click `install-open-with-antigravity.reg`
   - **Chinese**: Double-click `install-open-with-antigravity-zh.reg` (UTF-16 LE encoded)
3. Click "Yes" when Windows asks for confirmation
4. Restart File Explorer or log out and back in

**Uninstall**: Double-click `uninstall-open-with-antigravity.reg`

**Note:** Uses `HKEY_CURRENT_USER` instead of `HKEY_CLASSES_ROOT`

### Method 2: PowerShell Script (No Admin Required)

**Advantages**: Automatic language detection, no manual configuration needed

1. **Install**: Right-click `install-open-with-antigravity.ps1` → "Run with PowerShell"
2. **Uninstall**: Right-click `uninstall-open-with-antigravity.ps1` → "Run with PowerShell"

The script will automatically detect your system language.

### Method 3: Batch Script (No Admin Required)

**Advantages**: Simple and straightforward, no Python installation required

1. **Install**: Double-click `install-open-with-antigravity.bat`
2. **Uninstall**: Double-click `uninstall-open-with-antigravity.bat`

### Method 4: Python Script (No Admin Required)

**Advantages**: Editable Python source, easy to customize for a Windows installation

**Prerequisites**: Python 3.x installed

1. **Install**: Run `python install-open-with-antigravity.py`
2. **Uninstall**: Run `python uninstall-open-with-antigravity.py`

### Method 5: Executable Files (No Admin Required)

**Advantages**: No Python installation required, portable, double-click to run

**Note**: These `.exe` files are compiled from the Python scripts using PyInstaller

1. **Install**: Double-click `dist/install-open-with-antigravity.exe`
2. **Uninstall**: Double-click `dist/uninstall-open-with-antigravity.exe`

## Files

### Registry Files
- `install-open-with-antigravity.reg` - Install (English, no admin)
- `install-open-with-antigravity-zh.reg` - Install (Chinese, no admin)
- `uninstall-open-with-antigravity.reg` - Uninstall (both languages)

### PowerShell Scripts
- `install-open-with-antigravity.ps1` - Install (auto-detect language)
- `uninstall-open-with-antigravity.ps1` - Uninstall

### Batch Scripts
- `install-open-with-antigravity.bat` - Install (auto-detect language)
- `uninstall-open-with-antigravity.bat` - Uninstall

### Python Scripts
- `install-open-with-antigravity.py` - Install (auto-detect language)
- `uninstall-open-with-antigravity.py` - Uninstall

### Executable Files (Compiled from Python)
- `dist/install-open-with-antigravity.exe` - Install (no Python required)
- `dist/uninstall-open-with-antigravity.exe` - Uninstall (no Python required)

## Manual Installation Steps

**For detailed comparison of all installation methods**, see [comparison-of-installation-methods.md](comparison-of-installation-methods.md).

If you prefer to manually edit the registry:
- For detailed manual installation steps, please refer to [README_en.md](README_en.md).
- For detailed manual installation steps (in Chinese), please refer to [README_zh-CN.md](README_zh-CN.md).


## Related Projects

- [Open-with-Cursor](https://github.com/yuzhounh/Open-with-Cursor) - A separate Cursor context-menu installer using Python/EXE files and administrator privileges.

- [Open-with-Cursor-by-reg](https://github.com/yuzhounh/Open-with-Cursor-by-reg) - The per-user `.reg` alternative for Cursor. These Cursor tools are adjacent projects and are not required by the Antigravity installer.


## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

Special thanks to [Ryan Johnson](https://github.com/AMDphreak) for his original contributions, especially regarding the .reg implementation.

## Contact

Jing Wang - wangjing@xynu.edu.cn

Project Link: https://github.com/yuzhounh/Open-with-Antigravity

