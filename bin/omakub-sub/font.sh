#!/bin/bash
# Omakub字体设置脚本

# 设置字体的函数
# 参数:
# $1 - 字体名称
# $2 - 下载URL
# $3 - 字体文件类型（ttf或otf）
set_font() {
	local font_name=$1
	local url=$2
	local file_type=$3
	# 从字体名称中移除"Nerd Font"部分，用于文件名
	local file_name="${font_name/ Nerd Font/}"

	# 检查字体是否已安装，如果没有则下载并安装
	if ! $(fc-list | grep -i "$font_name" >/dev/null); then
		cd /tmp
		# 下载字体压缩包
		wget -O "$file_name.zip" "$url"
		# 解压字体文件
		unzip "$file_name.zip" -d "$file_name"
		# 复制字体文件到用户字体目录
		cp "$file_name"/*."$file_type" ~/.local/share/fonts
		# 清理临时文件
		rm -rf "$file_name.zip" "$file_name"
		# 更新字体缓存
		fc-cache
		cd -
		clear
		# 显示ASCII艺术标志
		source $OMAKUB_PATH/ascii.sh
	fi

	# 设置GNOME桌面的等宽字体
	gsettings set org.gnome.desktop.interface monospace-font-name "$font_name 10"
	# 设置Alacritty终端的字体
	cp "$OMAKUB_PATH/configs/alacritty/fonts/$file_name.toml" ~/.config/alacritty/font.toml
	# 设置VSCode编辑器的字体
	sed -i "s/\"editor.fontFamily\": \".*\"/\"editor.fontFamily\": \"$font_name\"/g" ~/.config/Code/User/settings.json
}

# 检查是否有命令行参数
if [ "$#" -gt 1 ]; then
	# 使用最后一个参数作为选择
	choice=${!#}
else
	# 使用gum工具显示字体选择菜单
	choice=$(gum choose "Cascadia Mono" "Fira Mono" "JetBrains Mono" "Meslo" "> Change size" "<< Back" --height 8 --header "Choose your programming font")
fi

# 根据用户选择执行相应操作
case $choice in
"Cascadia Mono")
	# 设置Cascadia Mono字体
	set_font "CaskaydiaMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip" "ttf"
	;;
"Fira Mono")
	# 设置Fira Mono字体
	set_font "FiraMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.zip" "otf"
	;;
"JetBrains Mono")
	# 设置JetBrains Mono字体
	set_font "JetBrainsMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" "ttf"
	;;
"Meslo")
	# 设置Meslo字体
	set_font "MesloLGS Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip" "ttf"
	;;
"> Change size")
	# 切换到字体大小设置脚本
	source $OMAKUB_PATH/bin/omakub-sub/font-size.sh
	exit
	;;
esac

# 返回主菜单
source $OMAKUB_PATH/bin/omakub-sub/menu.sh
