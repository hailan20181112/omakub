#!/bin/bash
# 设置脚本在遇到错误时立即退出
set -e

# 为用户提供安装失败后重试的机会
trap 'echo "Omakub installation failed! You can retry by running: source ~/.local/share/omakub/install.sh"' ERR

# 检查系统发行版名称和版本，如果不兼容则中止安装
source ~/.local/share/omakub/install/check-version.sh

# 询问用户选择要安装的应用程序
echo "Get ready to make a few choices..."
# 安装gum工具，用于创建交互式命令行界面
source ~/.local/share/omakub/install/terminal/required/app-gum.sh >/dev/null
# 执行首次运行选择脚本
source ~/.local/share/omakub/install/first-run-choices.sh

# 仅在运行GNOME桌面环境时安装桌面软件和调整
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # 确保计算机在安装过程中不会休眠或锁屏
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0

  echo "Installing terminal and desktop tools..."

  # 安装终端工具
  source ~/.local/share/omakub/install/terminal.sh

  # 安装桌面工具和调整
  source ~/.local/share/omakub/install/desktop.sh

  # 恢复正常的空闲和锁定设置
  gsettings set org.gnome.desktop.screensaver lock-enabled true
  gsettings set org.gnome.desktop.session idle-delay 300
else
  echo "Only installing terminal tools..."
  # 仅安装终端工具
  source ~/.local/share/omakub/install/terminal.sh
fi
