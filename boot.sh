#!/bin/bash
# 设置脚本在遇到错误时立即退出
set -e

# Omakub ASCII 艺术标志
ascii_art='________                  __        ___.
\_____  \   _____ _____  |  | ____ _\_ |__
 /   |   \ /     \\__   \ |  |/ /  |  \ __ \
/    |    \  Y Y  \/ __ \|    <|  |  / \_\ \
\_______  /__|_|  (____  /__|_ \____/|___  /
        \/      \/     \/     \/         \/
'

# 显示ASCII艺术标志
echo -e "$ascii_art"
# 显示安装提示信息
echo "=> Omakub is for fresh Ubuntu 24.04+ installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

# 更新软件包列表并安装git
sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

# 克隆Omakub仓库
echo "Cloning Omakub..."
rm -rf ~/.local/share/omakub
git clone https://github.com/basecamp/omakub.git ~/.local/share/omakub >/dev/null
# 如果设置了非master分支的环境变量，则切换到指定分支
if [[ $OMAKUB_REF != "master" ]]; then
	cd ~/.local/share/omakub
	git fetch origin "${OMAKUB_REF:-stable}" && git checkout "${OMAKUB_REF:-stable}"
	cd -
fi

# 开始安装过程
echo "Installation starting..."
source ~/.local/share/omakub/install.sh
