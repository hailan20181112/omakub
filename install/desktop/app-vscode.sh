#!/bin/bash
# Visual Studio Code安装脚本

# 切换到临时目录
cd /tmp
# 下载并导入Microsoft的GPG密钥
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
# 安装GPG密钥到系统
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
# 添加VS Code的APT仓库
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
# 清理临时文件
rm -f packages.microsoft.gpg
# 返回原目录
cd -

# 更新软件包列表
sudo apt update -y
# 安装VS Code
sudo apt install -y code

# 创建VS Code配置目录
mkdir -p ~/.config/Code/User
# 复制Omakub的VS Code配置文件
cp ~/.local/share/omakub/configs/vscode.json ~/.config/Code/User/settings.json

# 安装默认支持的主题
code --install-extension enkia.tokyo-night  # 安装Tokyo Night主题
