#!/bin/bash
# Obsidian安装脚本 - 多平台笔记应用程序
# Obsidian是一个多平台笔记应用程序，详情参见：https://obsidian.md

# 显示安装即将开始的提示，并显示进度动画
gum spin --spinner meter --title "Obsidian installation about to start. It may take up to 20 minutes on some systems!" -- sleep 3
# 使用Flatpak安装Obsidian
flatpak install -y flathub md.obsidian.Obsidian
