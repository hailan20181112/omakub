#!/bin/bash
# GNOME桌面Dock栏设置脚本

# Dock栏收藏应用列表
apps=(
	"google-chrome.desktop"          # Google Chrome浏览器
	"Alacritty.desktop"              # Alacritty终端
	"Neovim.desktop"                 # Neovim编辑器
	"code.desktop"                   # Visual Studio Code编辑器
	"WhatsApp.desktop"               # WhatsApp通讯工具
	"signal-desktop.desktop"         # Signal通讯工具
	"Zoom.desktop"                   # Zoom视频会议
	"spotify.desktop"                # Spotify音乐播放器
	"steam.desktop"                  # Steam游戏平台
	"pinta_pinta.desktop"            # Pinta图像编辑器
	"md.obsidian.Obsidian.desktop"   # Obsidian笔记应用
	"Activity.desktop"               # 系统活动监视器
	"Docker.desktop"                 # Docker容器管理
	"Omakub.desktop"                 # Omakub控制面板
	"1password.desktop"              # 1Password密码管理器
	"org.gnome.Settings.desktop"     # GNOME设置
	"org.gnome.Nautilus.desktop"     # 文件管理器
	"localsend_app.desktop"          # LocalSend文件传输工具
)

# 用于存储已安装的收藏应用的数组
installed_apps=()

# .desktop文件通常存储的目录
desktop_dirs=(
	"/var/lib/flatpak/exports/share/applications"  # Flatpak应用目录
	"/usr/share/applications"                      # 系统应用目录
	"/usr/local/share/applications"                # 本地系统应用目录
	"$HOME/.local/share/applications"              # 用户应用目录
)

# 检查每个应用的.desktop文件是否存在
for app in "${apps[@]}"; do
	for dir in "${desktop_dirs[@]}"; do
		if [ -f "$dir/$app" ]; then
			# 如果找到应用，添加到已安装应用列表
			installed_apps+=("$app")
			break
		fi
	done
done

# 将数组转换为gsettings适用的格式
favorites_list=$(printf "'%s'," "${installed_apps[@]}")
favorites_list="[${favorites_list%,}]"

# 设置收藏应用到GNOME Shell
gsettings set org.gnome.shell favorite-apps "$favorites_list"
