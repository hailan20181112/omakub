#!/bin/bash
# 创建Docker桌面应用程序 - 使用LazyDocker管理Docker容器

# 创建桌面文件
cat <<EOF >~/.local/share/applications/Docker.desktop
[Desktop Entry]
Version=1.0
Name=Docker
Comment=Manage Docker containers with LazyDocker
Exec=alacritty --config-file /home/$USER/.config/alacritty/pane.toml --class=Docker --title=Docker -e lazydocker
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/Docker.png
Categories=GTK;
StartupNotify=false
EOF
