#!/bin/bash
# Gum安装脚本 - 用于创建美观的命令行界面
# Gum用于在初始安装后定制Omakub的命令行界面

# 切换到临时目录
cd /tmp
# 设置Gum版本（使用已知的稳定版本）
GUM_VERSION="0.14.3" # 使用已知的稳定版本
# 下载指定版本的Gum
wget -qO gum.deb "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_amd64.deb"
# 安装Gum
sudo apt-get install -y ./gum.deb
# 清理临时文件
rm gum.deb
# 返回原目录
cd -
