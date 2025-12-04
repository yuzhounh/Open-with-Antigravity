# 为Windows添加Antigravity编辑器的右键菜单选项

本指南介绍如何通过修改Windows注册表，为文件、文件夹以及文件夹背景添加Antigravity编辑器的右键菜单选项。

## 快速安装（推荐）

最简单的方法是使用提供的 `.reg` 文件：

1. **修改配置**：打开 `install-open-with-Antigravity-zh.reg` 文件，将所有 `<YourUsername>` 替换为您的Windows用户名
2. **安装**：双击修改后的 `install-open-with-Antigravity-zh.reg`，在提示时点击"是"
3. **卸载**：双击 `uninstall-open-with-Antigravity.reg`，在提示时点击"是"
4. 重启文件资源管理器或重新登录以使更改生效

## 手动安装（高级）

如果您希望手动编辑注册表或需要自定义安装：

### 注意事项

- 修改注册表可能影响系统稳定性，操作前请务必备份相关注册表项。
- 请将下面所有路径中的 `<YourUsername>` 替换为您的实际Windows用户名。
- 如遇问题，可以删除添加的注册表项或使用卸载 `.reg` 文件来撤销更改。
- 本指南使用 `HKEY_CURRENT_USER` 而非 `HKEY_CLASSES_ROOT`，这意味着更改是用户特定的，不需要管理员权限。

### 为文件添加右键菜单选项

1. 打开注册表编辑器（按Win+R，输入"regedit"并回车）。
2. 导航至 `HKEY_CURRENT_USER\Software\Classes\*\shell`.
3. 右击"shell"文件夹，选择"新建" > "项"，将其命名为"Antigravity".
4. 在右侧窗格中，将"(默认)"值设置为"通过 Antigravity 打开".
5. 创建一个名为"Icon"的字符串值，将其设置为：
   `C:\Users\<YourUsername>\AppData\Local\Programs\Antigravity\Antigravity.exe`
6. 在"Antigravity"下创建"command"子项。
7. 在"command"中，将"(默认)"值设置为：
   `"C:\Users\<YourUsername>\AppData\Local\Programs\Antigravity\Antigravity.exe" "%1"`

### 为文件夹添加右键菜单选项

1. 导航至 `HKEY_CURRENT_USER\Software\Classes\Directory\shell`.
2. 按照上述步骤3-6进行操作.
3. 在"command"中，将"(默认)"值设置为：
   `"C:\Users\<YourUsername>\AppData\Local\Programs\Antigravity\Antigravity.exe" "%V"`

### 为文件夹背景添加右键菜单选项

1. 导航至 `HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell`.
2. 按照上述步骤3-6进行操作.
3. 在"command"中，将"(默认)"值设置为：
   `"C:\Users\<YourUsername>\AppData\Local\Programs\Antigravity\Antigravity.exe" "%V"`

## 使更改生效

完成上述步骤后，请执行以下操作之一使更改生效：

- 重启文件资源管理器
- 重新登录Windows

现在，您可以在文件、文件夹，以及文件夹空白处右击时看到"通过 Antigravity 打开"的选项，这将大大提高您的工作效率。