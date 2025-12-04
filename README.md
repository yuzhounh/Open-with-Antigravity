# Open with Antigravity - Context Menu Integration

This project adds Antigravity editor options to the Windows context menu for files, folders, and folder backgrounds by modifying the Windows registry.

## Features

- Adds "Open with Antigravity" option to the context menu for files, folders, and folder backgrounds
- Adds "通过 Antigravity 打开" option for Chinese language users
- No administrator privileges required
- User-specific installation (affects only current user)
- Works on work laptops and corporate environments

## Installation Methods

This project provides **five different installation methods**. Choose the one that best suits your needs:

### Method 1: Registry Files (No Admin Required) ⭐ Recommended

**Advantages**: User-specific, no administrator privileges required, works in corporate environments

1. **Modify Configuration**: Open the `.reg` file and replace `<YourUsername>` with your Windows username
2. **Install**:
   - **English**: Double-click `install-open-with-Antigravity.reg`
   - **Chinese**: Double-click `install-open-with-Antigravity-zh.reg`
3. Click "Yes" when Windows asks for confirmation
4. Restart File Explorer or log out and back in

**Uninstall**: Double-click `uninstall-open-with-Antigravity.reg`

**Note:** Uses `HKEY_CURRENT_USER` instead of `HKEY_CLASSES_ROOT`

### Method 2: PowerShell Script (No Admin Required)

**Advantages**: Automatic language detection, no manual configuration needed

1. **Install**: Right-click `install-open-with-antigravity.ps1` → "Run with PowerShell"
2. **Uninstall**: Right-click `uninstall-open-with-antigravity.ps1` → "Run with PowerShell"

The script will automatically detect your system language.

### Method 3: Batch Script (No Admin Required)

**Advantages**: Simple and straightforward, works on all Windows versions

1. **Install**: Double-click `install-open-with-antigravity.bat`
2. **Uninstall**: Double-click `uninstall-open-with-antigravity.bat`

### Method 4: Python Script (No Admin Required)

**Advantages**: Cross-platform compatibility, easy to customize

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
- `install-open-with-Antigravity.reg` - Install (English, no admin)
- `install-open-with-Antigravity-zh.reg` - Install (Chinese, no admin)
- `uninstall-open-with-Antigravity.reg` - Uninstall (both languages)

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

- [Open-with-Cursor](https://github.com/yuzhounh/Open-with-Cursor) - Add Cursor editor options to the Windows context menu for files, folders, and folder backgrounds.

- [Open-with-Cursor-by-reg](https://github.com/yuzhounh/Open-with-Cursor-by-reg) - Add Cursor editor options to the Windows context menu for files, folders, and folder backgrounds.


## License

This project is licensed under the GNU General Public License v3.0 (GPL-3.0). See the [LICENSE](LICENSE) file for details.

## Acknowledgments

Special thanks to [Ryan Johnson](https://github.com/AMDphreak) for his original contributions, especially regarding the .reg implementation.

## Contact

Jing Wang - wangjing@xynu.edu.cn

Project Link: https://github.com/yuzhounh/Open-with-Antigravity

