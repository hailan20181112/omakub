#!/bin/bash
# 创建Activity桌面应用程序 - 显示系统活动监视器

# 创建桌面文件
cat <<EOF >~/.local/share/applications/Activity.desktop
[Desktop Entry]
Version=1.0
Name=Activity
Comment=System activity from btop
Exec=alacritty --config-file /home/$USER/.config/alacritty/btop.toml --class=Activity --title=Activity -e btop
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/Activity.png
Categories=GTK;
StartupNotify=false
EOF
