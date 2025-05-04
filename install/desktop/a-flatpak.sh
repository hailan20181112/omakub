#!/bin/bash
# Flatpak安装脚本 - 安装Flatpak应用程序管理器

# 安装Flatpak包管理器
sudo apt install -y flatpak
# 安装GNOME软件中心的Flatpak插件
sudo apt install -y gnome-software-plugin-flatpak
# 添加Flathub仓库（如果不存在）
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
