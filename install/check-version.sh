#!/bin/bash
# 系统版本检查脚本 - 确保Omakub仅在兼容的系统上安装

# 检查是否存在os-release文件（用于确定Linux发行版）
if [ ! -f /etc/os-release ]; then
  # 如果文件不存在，显示错误信息并退出
  echo "$(tput setaf 1)Error: Unable to determine OS. /etc/os-release file not found."
  echo "Installation stopped."
  exit 1
fi

# 加载os-release文件中的变量（包含发行版ID和版本号）
. /etc/os-release

# 检查是否运行在Ubuntu 24.04或更高版本上
if [ "$ID" != "ubuntu" ] || [ $(echo "$VERSION_ID >= 24.04" | bc) != 1 ]; then
  # 如果不是Ubuntu 24.04+，显示错误信息并退出
  echo "$(tput setaf 1)Error: OS requirement not met"
  echo "You are currently running: $ID $VERSION_ID"
  echo "OS required: Ubuntu 24.04 or higher"
  echo "Installation stopped."
  exit 1
fi

# 检查是否运行在x86架构上
ARCH=$(uname -m)
if [ "$ARCH" != "x86_64" ] && [ "$ARCH" != "i686" ]; then
  # 如果不是x86架构，显示错误信息并退出
  echo "$(tput setaf 1)Error: Unsupported architecture detected"
  echo "Current architecture: $ARCH"
  echo "This installation is only supported on x86 architectures (x86_64 or i686)."
  echo "Installation stopped."
  exit 1
fi
