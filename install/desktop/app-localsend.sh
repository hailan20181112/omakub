#!/bin/bash
# LocalSend安装脚本 - 局域网文件传输工具

# 切换到临时目录
cd /tmp
# 获取LocalSend的最新版本号
LOCALSEND_VERSION=$(curl -s "https://api.github.com/repos/localsend/localsend/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
# 下载最新版本的LocalSend
wget -O localsend.deb "https://github.com/localsend/localsend/releases/latest/download/LocalSend-${LOCALSEND_VERSION}-linux-x86-64.deb"
# 安装LocalSend
sudo apt install -y ./localsend.deb
# 清理临时文件
rm localsend.deb
# 返回原目录
cd -
