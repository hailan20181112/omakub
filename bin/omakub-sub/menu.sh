#!/bin/bash
# Omakub主菜单脚本

# 如果没有传入参数，则显示交互式菜单让用户选择
if [ $# -eq 0 ]; then
	# 使用gum工具创建交互式菜单，并将选择结果转换为小写
	SUB=$(gum choose "Theme" "Font" "Update" "Install" "Uninstall" "Manual" "Quit" --height 10 --header "" | tr '[:upper:]' '[:lower:]')
else
	# 如果有传入参数，则使用第一个参数
	SUB=$1
fi

# 如果选择了有效的选项（非空且不是quit），则加载相应的子脚本
[ -n "$SUB" ] && [ "$SUB" != "quit" ] && source $OMAKUB_PATH/bin/omakub-sub/$SUB.sh
