#!/bin/bash
# Fastfetch安装脚本 - 在终端中显示系统信息

# 添加Fastfetch的PPA仓库
sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
# 更新软件包列表
sudo apt update -y
# 安装Fastfetch
sudo apt install -y fastfetch

# 仅在fastfetch配置文件不存在时设置配置
if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
  # 创建配置目录
  mkdir -p ~/.config/fastfetch
  # 复制Omakub的fastfetch配置文件
  cp ~/.local/share/omakub/configs/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
fi
