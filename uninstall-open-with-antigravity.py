import winreg

def remove_antigravity_menu(key_path):
    try:
        # Use HKEY_CURRENT_USER instead of HKEY_CLASSES_ROOT (no admin required)
        full_key_path = f"Software\\Classes\\{key_path}\\Antigravity"
        
        # Try to delete command subkey first
        try:
            winreg.DeleteKey(winreg.HKEY_CURRENT_USER, f"{full_key_path}\\command")
        except WindowsError:
            pass
        
        # Then delete the main Antigravity key
        winreg.DeleteKey(winreg.HKEY_CURRENT_USER, full_key_path)
        print(f"✓ Successfully removed Antigravity menu from {key_path}")
    except WindowsError as e:
        if e.winerror == 2:  # File not found
            print(f"○ Antigravity menu not found in {key_path} (already removed)")
        else:
            print(f"✗ Error removing Antigravity menu from {key_path}: {e}")

def main():
    print("Uninstalling Antigravity context menu (user-level, no admin required)...")
    print()

    # Remove right-click menu for files
    remove_antigravity_menu(r"*\shell")

    # Remove right-click menu for folders
    remove_antigravity_menu(r"Directory\shell")

    # Remove right-click menu for folder background
    remove_antigravity_menu(r"Directory\Background\shell")

    print()
    print("✓ Uninstallation completed successfully!")
    print("  Please restart File Explorer or log out and log back in to Windows for changes to take effect.")
    input("\nPress Enter to exit...")

if __name__ == "__main__":
    main()
