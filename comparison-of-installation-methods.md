# Installation Methods Comparison

This document provides a detailed comparison of all available installation methods for adding Antigravity to the Windows context menu.

## Quick Comparison Table

| Method | Admin Required | Auto Language Detection | Manual Config | Complexity | Best For |
|--------|---------------|------------------------|---------------|------------|----------|
| **Registry Files** | ❌ No | ❌ No | ✅ Yes | ⭐ Easy | Manual review, simple installation |
| **PowerShell** | ❌ No | ✅ Yes | ❌ No | ⭐⭐ Medium | Windows 10/11 users, automatic setup |
| **Batch Script** | ❌ No | ✅ Yes | ❌ No | ⭐ Easy | All Windows versions, simple automation |
| **Python Script** | ❌ No | ✅ Yes | ❌ No | ⭐⭐⭐ Advanced | Developers, customization needs |
| **Executable Files** | ❌ No | ✅ Yes | ❌ No | ⭐ Easy | No Python required, portable |

**All methods now use user-level installation (HKEY_CURRENT_USER) - No administrator privileges required!**

## Detailed Comparison

### 1. Registry Files (.reg)

**Pros:**
- ✅ No administrator privileges required
- ✅ Works in corporate/restricted environments
- ✅ User-specific installation (doesn't affect other users)
- ✅ Simple double-click installation
- ✅ Easy to review changes before applying

**Cons:**
- ❌ Requires manual username configuration
- ❌ Separate files for different languages
- ❌ Manual language selection needed

**When to use:**
- Want to review exact registry changes
- Prefer manual control over installation
- Need to verify changes before applying

**Files:**
- `install-open-with-Antigravity.reg` (English)
- `install-open-with-Antigravity-zh.reg` (Chinese)
- `uninstall-open-with-Antigravity.reg`

> **Technical Note:** Why absolute paths?
> Standard `.reg` files treat text as `REG_SZ` (fixed string), which does not expand environment variables like `%LOCALAPPDATA%`. To support variables, the type must be `REG_EXPAND_SZ`, which in `.reg` files requires unreadable hexadecimal encoding (e.g., `hex(2):25,00,4c,00...`). For readability and maintainability, we use absolute paths in `.reg` files. Scripts (Method 2-5) handle this automatically.

---

### 2. PowerShell Script (.ps1)

**Pros:**
- ✅ No administrator privileges required
- ✅ Automatic language detection
- ✅ No manual configuration needed
- ✅ Detailed error messages
- ✅ Color-coded output
- ✅ Built into Windows 10/11
- ✅ User-specific installation

**Cons:**
- ❌ May require execution policy changes
- ❌ Only works on Windows 7 and later

**When to use:**
- Using Windows 10 or later
- Want automatic language detection
- Prefer modern scripting approach
- Want detailed feedback during installation

**Files:**
- `install-open-with-antigravity.ps1`
- `uninstall-open-with-antigravity.ps1`

**How to run:**
```powershell
# Right-click the .ps1 file → "Run with PowerShell"
# Or from PowerShell:
.\install-open-with-antigravity.ps1
```

---

### 3. Batch Script (.bat)

**Pros:**
- ✅ No administrator privileges required
- ✅ Automatic language detection
- ✅ No manual configuration needed
- ✅ Works on all Windows versions (XP to 11)
- ✅ Simple and reliable
- ✅ Clear status messages
- ✅ No additional dependencies
- ✅ User-specific installation

**Cons:**
- ❌ Less sophisticated error handling
- ❌ Basic output formatting

**When to use:**
- Using older Windows versions
- Want maximum compatibility
- Prefer traditional batch scripting
- Need simple, reliable automation

**Files:**
- `install-open-with-antigravity.bat`
- `uninstall-open-with-antigravity.bat`

**How to run:**
```batch
# Simply double-click the .bat file
```

---

### 4. Python Script (.py)

**Pros:**
- ✅ No administrator privileges required
- ✅ Automatic language detection
- ✅ Cross-platform code (can be adapted for other OS)
- ✅ Easy to customize and extend
- ✅ Well-structured and maintainable code
- ✅ User-specific installation
- ✅ Source code available for review

**Cons:**
- ❌ Requires Python 3.x installation
- ❌ More complex for non-developers

**When to use:**
- You have Python installed
- Need to customize the installation
- Want to understand/modify the code
- Developing similar tools

**Files:**
- `install-open-with-antigravity.py`
- `uninstall-open-with-antigravity.py`

**How to run:**
```bash
# With Python:
python install-open-with-antigravity.py
```

---

### 5. Executable Files (.exe)

**Pros:**
- ✅ No administrator privileges required
- ✅ No Python installation required
- ✅ Automatic language detection
- ✅ Portable - can be run from anywhere
- ✅ Simple double-click execution
- ✅ User-specific installation
- ✅ Works on any Windows system

**Cons:**
- ❌ Larger file size than scripts
- ❌ Cannot easily review/modify code

**When to use:**
- Don't have Python installed
- Want the simplest installation method
- Need portable executables
- Prefer GUI-like experience

**Files:**
- `dist/install-open-with-antigravity.exe` (compiled from Python using PyInstaller)
- `dist/uninstall-open-with-antigravity.exe` (compiled from Python using PyInstaller)

**Note:** These `.exe` files are compiled from the Python scripts using PyInstaller. They contain the Python interpreter and all dependencies, so no Python installation is needed.

**How to run:**
```batch
# Simply double-click the .exe file
# Or from command line:
.\dist\install-open-with-antigravity.exe
```

---

## Registry Keys Explained

All methods modify the same Windows registry keys under **HKEY_CURRENT_USER** (user-specific, no admin required):

### For Files:
```
HKEY_CURRENT_USER\Software\Classes\*\shell\Antigravity
HKEY_CURRENT_USER\Software\Classes\*\shell\Antigravity\command
```

### For Folders:
```
HKEY_CURRENT_USER\Software\Classes\Directory\shell\Antigravity
HKEY_CURRENT_USER\Software\Classes\Directory\shell\Antigravity\command
```

### For Folder Background:
```
HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\Antigravity
HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\Antigravity\command
```

**Note:** All installations are user-specific and only affect the current user account.

---

## Troubleshooting

### PowerShell Execution Policy Error

If you get an error about execution policy:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Antigravity Not Found Error

All scripts check for Antigravity at:
```
C:\Users\<YourUsername>\AppData\Local\Programs\Antigravity\Antigravity.exe
```

If installed elsewhere, you'll need to modify the scripts or registry files.

### Changes Not Appearing

After installation, you must:
1. Restart File Explorer (Task Manager → End Task → Restart)
2. Or log out and log back in to Windows

---

## Recommendation

**For most users:** Use **Method 5 (Executable Files)** for the simplest installation - no Python required, just double-click!

**For automatic installation with scripts:** Use **Method 2 (PowerShell)** or **Method 3 (Batch Script)** for automatic language detection.

**For manual review:** Use **Method 1 (Registry Files)** to see exactly what changes will be made.

**For developers:** Use **Method 4 (Python)** for easy customization and source code access.

**For maximum compatibility:** Use **Method 3 (Batch Script)** - works on all Windows versions.

---

## Key Advantage: No Admin Rights Required!

All methods now use `HKEY_CURRENT_USER\Software\Classes` instead of `HKEY_CLASSES_ROOT`, which means:

- ✅ No administrator privileges needed
- ✅ Works in corporate/restricted environments
- ✅ User-specific installation (doesn't affect other users)
- ✅ Safer and easier to install/uninstall
- ✅ No UAC prompts
