#!/bin/bash
# 创建Omakub桌面应用程序 - Omakub控制面板

# 创建桌面文件
cat <<EOF >~/.local/share/applications/Omakub.desktop
[Desktop Entry]
Version=1.0
Name=Omakub
Comment=Omakub Controls
Exec=alacritty --config-file /home/$USER/.config/alacritty/pane.toml --class=Omakub --title=Omakub -e omakub
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/Omakub.png
Categories=GTK;
StartupNotify=false
EOF
