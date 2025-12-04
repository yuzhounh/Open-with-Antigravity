# Add Antigravity Editor Right-Click Menu Options for Windows

This guide explains how to add right-click menu options for the Antigravity editor to files, folders, and folder backgrounds by modifying the Windows registry.

## Quick Installation (Recommended)

The easiest way is to use the provided `.reg` files:

1. **Installation**: Double-click `install-open-with-Antigravity.reg` and click "Yes" when prompted
2. **Uninstallation**: Double-click `uninstall-open-with-Antigravity.reg` and click "Yes" when prompted
3. Restart File Explorer or log out and back in for changes to take effect

## Manual Installation (Advanced)

If you prefer to manually edit the registry or need to customize the installation:

### Precautions

- Modifying the registry may affect system stability. Be sure to back up the relevant registry entries before proceeding.
- Replace `<YourUsername>` with your actual Windows username in all paths below.
- If you encounter issues, you can undo the changes by deleting the added registry entries or using the uninstall `.reg` file.
- This guide uses `HKEY_CURRENT_USER` instead of `HKEY_CLASSES_ROOT`, which means the changes are user-specific and do not require administrator privileges.

### Add Right-Click Menu Option for Files

1. Open the Registry Editor (press Win+R, type "regedit" and press Enter).
2. Navigate to `HKEY_CURRENT_USER\Software\Classes\*\shell`.
3. Right-click the "shell" folder, select "New" > "Key", and name it "Antigravity".
4. In the right pane, set the "(Default)" value to "Open with Antigravity".
5. Create a string value named "Icon" and set it to:
   `C:\Users\<YourUsername>\AppData\Local\Programs\Antigravity\Antigravity.exe`
6. Create a "command" subkey under "Antigravity".
7. In "command", set the "(Default)" value to:
   `"C:\Users\<YourUsername>\AppData\Local\Programs\Antigravity\Antigravity.exe" "%1"`

### Add Right-Click Menu Option for Folders

1. Navigate to `HKEY_CURRENT_USER\Software\Classes\Directory\shell`.
2. Follow steps 3-6 as described above to add the right-click menu option for folders.
3. In "command", set the "(Default)" value to:
   `"C:\Users\<YourUsername>\AppData\Local\Programs\Antigravity\Antigravity.exe" "%V"`

### Add Right-Click Menu Option for Folder Backgrounds

1. Navigate to `HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell`.
2. Follow steps 3-6 as described above to add the right-click menu option for folder backgrounds.
3. In "command", set the "(Default)" value to:
   `"C:\Users\<YourUsername>\AppData\Local\Programs\Antigravity\Antigravity.exe" "%V"`

## Apply Changes

After completing the above steps, do one of the following to apply the changes:

- Restart File Explorer
- Log out and log back into Windows

Now, you should see the "Open with Antigravity" option when right-clicking on files, folders, and empty spaces within folders, which will greatly improve your work efficiency.
