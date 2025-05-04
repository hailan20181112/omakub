#!/bin/bash
# Cursor安装脚本 - AI驱动的代码编辑器

# 切换到临时目录
cd /tmp
# 下载Cursor AppImage文件
curl -L "https://www.cursor.com/api/download?platform=linux-x64&releaseTrack=stable" | jq -r '.downloadUrl' | xargs curl -L -o cursor.appimage
# 移动AppImage文件到系统目录
sudo mv cursor.appimage /opt/cursor.appimage
# 设置AppImage文件为可执行
sudo chmod +x /opt/cursor.appimage
# 安装FUSE3（用于运行AppImage）
sudo apt install -y fuse3
# 安装libfuse2t64（用于运行AppImage）
sudo apt install -y libfuse2t64

# 设置桌面文件路径
DESKTOP_FILE="/usr/share/applications/cursor.desktop"

# 创建桌面文件
sudo bash -c "cat > $DESKTOP_FILE" <<EOL
[Desktop Entry]
Name=Cursor
Comment=AI-powered code editor
Exec=/opt/cursor.appimage --no-sandbox
Icon=/home/$USER/.local/share/omakub/applications/icons/cursor.png
Type=Application
Categories=Development;IDE;
EOL

# 检查桌面文件是否创建成功
if [ -f "$DESKTOP_FILE" ]; then
	echo "cursor.desktop created successfully"
else
	echo "Failed to create cursor.desktop"
fi
