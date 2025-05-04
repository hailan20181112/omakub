#!/bin/bash
# LazyGit安装脚本 - Git终端用户界面

# 切换到临时目录
cd /tmp
# 获取LazyGit的最新版本号
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
# 下载最新版本的LazyGit
curl -sLo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
# 解压LazyGit二进制文件
tar -xf lazygit.tar.gz lazygit
# 安装LazyGit到系统目录
sudo install lazygit /usr/local/bin
# 清理临时文件
rm lazygit.tar.gz lazygit
# 创建LazyGit配置目录
mkdir -p ~/.config/lazygit/
# 创建空的配置文件
touch ~/.config/lazygit/config.yml
# 返回原目录
cd -
