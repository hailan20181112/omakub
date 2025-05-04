#!/bin/bash
# Mise安装脚本 - 用于管理多个编程语言版本的工具
# 详情参见：https://mise.jdx.dev/

# 安装必要的依赖
sudo apt update -y && sudo apt install -y gpg wget curl

# 创建APT密钥环目录
sudo install -dm 755 /etc/apt/keyrings

# 下载并安装Mise的GPG密钥
wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | sudo tee /etc/apt/keyrings/mise-archive-keyring.gpg 1>/dev/null

# 添加Mise的APT仓库
echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=$(dpkg --print-architecture)] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list

# 更新软件包列表
sudo apt update

# 安装Mise
sudo apt install -y mise
