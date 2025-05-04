#!/bin/bash
# Zellij安装脚本 - 终端复用器（类似于tmux或screen）

# 切换到临时目录
cd /tmp
# 下载最新版本的Zellij
wget -O zellij.tar.gz "https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz"
# 解压Zellij二进制文件
tar -xf zellij.tar.gz zellij
# 安装Zellij到系统目录
sudo install zellij /usr/local/bin
# 清理临时文件
rm zellij.tar.gz zellij
# 返回原目录
cd -

# 创建Zellij配置和主题目录
mkdir -p ~/.config/zellij/themes
# 如果配置文件不存在，则复制默认配置
[ ! -f "$HOME/.config/zellij/config.kdl" ] && cp ~/.local/share/omakub/configs/zellij.kdl ~/.config/zellij/config.kdl
# 复制Tokyo Night主题
cp ~/.local/share/omakub/themes/tokyo-night/zellij.kdl ~/.config/zellij/themes/tokyo-night.kdl
