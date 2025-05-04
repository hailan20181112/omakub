#!/bin/bash
# Omakub更新脚本

# 可更新的应用程序列表
CHOICES=(
	"Omakub        Update Omakub itself and run any migrations"
	"Ollama        Run LLMs, like Meta's Llama3, locally"
	"LazyGit       TUI for Git"
	"LazyDocker    TUI for Docker"
	"Neovim        Text editor that runs in the terminal"
	"Zellij        Adds panes, tabs, and sessions to the terminal"
	"<< Back       "
)

# 使用gum工具显示更新选择菜单
CHOICE=$(gum choose "${CHOICES[@]}" --height 10 --header "Update manually-managed applications")

# 处理用户选择
if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
	# 如果选择返回或未选择，则不更新任何内容
	echo ""
else
	# 提取应用程序名称并转换为小写，替换空格为连字符
	INSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

	# 根据选择的应用程序确定安装脚本路径
	case "$INSTALLER" in
	"omakub") INSTALLER_FILE="$OMAKUB_PATH/bin/omakub-sub/migrate.sh" ;; # Omakub自身更新和迁移
	"ollama") INSTALLER_FILE="$OMAKUB_PATH/install/terminal/optional/app-ollama.sh" ;; # Ollama更新
	*) INSTALLER_FILE="$OMAKUB_PATH/install/terminal/app-$INSTALLER.sh" ;; # 其他应用程序更新
	esac

	# 执行更新脚本并显示进度动画
	source $INSTALLER_FILE && gum spin --spinner globe --title "Update completed!" -- sleep 3
fi

# 清屏并返回Omakub主程序
clear
source $OMAKUB_PATH/bin/omakub
