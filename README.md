# Open with Cursor - Context Menu Integration

This project adds Cursor editor options to the Windows context menu for files, folders, and folder backgrounds by modifying the Windows registry.

## Features

- Adds "Open with Cursor" option to the context menu for files, folders, and folder backgrounds
- Adds "通过 Cursor 打开" option for Chinese language users
- No administrator privileges required
- User-specific installation (affects only current user)
- Works on work laptops and corporate environments

## Usage

### Quick Installation (Recommended)

1. **Modify Configuration**: Open the `.reg` file you want to use and replace all `<YourUsername>` with your Windows username
2. **English**: Double-click the modified `install-open-with-cursor.reg`
3. **Chinese**: Double-click the modified `install-open-with-cursor-zh.reg`
4. Click "Yes" when Windows asks for confirmation
5. Restart File Explorer or log out and back in

### Uninstallation

1. Double-click `uninstall-open-with-cursor.reg`
2. Click "Yes" when Windows asks for confirmation
3. Restart File Explorer or log out and back in

**Note:** The registry files use `HKEY_CURRENT_USER` instead of `HKEY_CLASSES_ROOT`, making the installation user-specific and eliminating the need for administrator privileges.

## Files

- `install-open-with-cursor.reg` - Install script (English)
- `install-open-with-cursor-zh.reg` - Install script (Chinese)
- `uninstall-open-with-cursor.reg` - Uninstall script (works for both languages)

## Manual Installation Steps

If you prefer to manually edit the registry:
- For detailed manual installation steps, please refer to [README_en.md](README_en.md).
- For detailed manual installation steps (in Chinese), please refer to [README_zh-CN.md](README_zh-CN.md).


## Related Projects

- [Open-with-Cursor](https://github.com/yuzhounh/Open-with-Cursor) - Add Cursor editor options to the Windows context menu for files, folders, and folder backgrounds.

- [Open with Cursor in Context Menu](https://github.com/Puliczek/open-with-cursor-context-menu) - A similar project that uses PowerShell scripts to achieve similar functionality.

- [cursor_ext_open-with-cursor-context-menu](https://github.com/eatcosmos/cursor_ext_open-with-cursor-context-menu) - A fork of the above project that adds a batch file for easy installation with a double-click.

- [Cursor Context Menu Installer](https://github.com/hexcreator/open-with-cursor) - A similar project that uses C++ scripts to achieve similar functionality.

## License

This project is licensed under the GNU General Public License v3.0 (GPL-3.0). See the [LICENSE](LICENSE) file for details.

## Acknowledgments

Special thanks to [Ryan Johnson](https://github.com/AMDphreak) for his original contribution. This project is entirely based on his work. I only replaced the relative paths with absolute paths and conducted feasibility testing.

## Contact

Jing Wang - wangjing@xynu.edu.cn

Project Link: https://github.com/yuzhounh/Open-with-Cursor-by-reg

