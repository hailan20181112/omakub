#!/bin/bash
# 终端工具安装脚本

# 安装所有安装程序所需的基本工具
sudo apt update -y                  # 更新软件包列表
sudo apt upgrade -y                 # 升级已安装的软件包
sudo apt install -y curl git unzip  # 安装基本工具：curl（网络传输工具）、git（版本控制）和unzip（解压工具）

# 运行所有终端安装脚本
for installer in ~/.local/share/omakub/install/terminal/*.sh; do source $installer; done
