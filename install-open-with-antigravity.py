import winreg
import os
import locale

def add_antigravity_menu(key_path, antigravity_path, use_v_param=False):
    try:
        # Use HKEY_CURRENT_USER instead of HKEY_CLASSES_ROOT (no admin required)
        full_key_path = f"Software\\Classes\\{key_path}"
        key = winreg.CreateKey(winreg.HKEY_CURRENT_USER, full_key_path)
        antigravity_key = winreg.CreateKey(key, "Antigravity")
        
        # Detect system default language
        system_language = locale.getdefaultlocale()[0]
        menu_text = "通过 Antigravity 打开" if system_language and system_language.startswith("zh_") else "Open with Antigravity"
        
        winreg.SetValue(antigravity_key, "", winreg.REG_SZ, menu_text)
        winreg.SetValueEx(antigravity_key, "Icon", 0, winreg.REG_SZ, antigravity_path)
        
        command_key = winreg.CreateKey(antigravity_key, "command")
        param = "%V" if use_v_param else "%1"
        winreg.SetValue(command_key, "", winreg.REG_SZ, f'"{antigravity_path}" "{param}"')
        
        print(f"✓ Successfully added Antigravity menu to {key_path}")
    except WindowsError as e:
        print(f"✗ Error adding Antigravity menu to {key_path}: {e}")

def main():
    print("Installing Antigravity context menu (user-level, no admin required)...")
    print()

    # Get the path to Antigravity.exe
    antigravity_path = os.path.expandvars(r"%LOCALAPPDATA%\Programs\Antigravity\Antigravity.exe")
    
    if not os.path.exists(antigravity_path):
        print("✗ Antigravity.exe not found. Please ensure Antigravity editor is properly installed.")
        print(f"  Expected path: {antigravity_path}")
        input("\nPress Enter to exit...")
        return

    # Add right-click menu for files
    add_antigravity_menu(r"*\shell", antigravity_path, use_v_param=False)

    # Add right-click menu for folders
    add_antigravity_menu(r"Directory\shell", antigravity_path, use_v_param=True)

    # Add right-click menu for folder background
    add_antigravity_menu(r"Directory\Background\shell", antigravity_path, use_v_param=True)

    print()
    print("✓ Installation completed successfully!")
    print("  Please restart File Explorer or log out and log back in to Windows for changes to take effect.")
    input("\nPress Enter to exit...")

if __name__ == "__main__":
    main()