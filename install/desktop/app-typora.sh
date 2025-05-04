#!/bin/bash
# Typora安装脚本 - Markdown编辑器

# 下载并安装Typora的GPG密钥
wget -qO - https://typora.io/linux/public-key.asc | sudo tee /etc/apt/trusted.gpg.d/typora.asc
# 添加Typora的APT仓库
sudo add-apt-repository -y 'deb https://typora.io/linux ./'
# 更新软件包列表
sudo apt update -y
# 安装Typora
sudo apt install -y typora

# 添加iA Writer风格的Typora主题
mkdir -p ~/.config/Typora/themes
# 复制日间主题
cp ~/.local/share/omakub/configs/typora/ia_typora.css ~/.config/Typora/themes/
# 复制夜间主题
cp ~/.local/share/omakub/configs/typora/ia_typora_night.css ~/.config/Typora/themes/
