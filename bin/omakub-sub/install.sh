#!/bin/bash
# Omakub安装应用程序脚本

# 可安装的应用程序列表
CHOICES=(
  "Dev Editor        Install alternative programming editors"        # 安装替代编程编辑器
  "Dev Language      Install programming language environment"       # 安装编程语言环境
  "Dev Database      Install development database in Docker"         # 在Docker中安装开发数据库
  "1password         Manage your passwords securely across devices"  # 跨设备安全管理密码
  "Audacity          Record and edit audio"                          # 录制和编辑音频
  "ASDControl        Set brightness on Apple Studio and XDR displays" # 设置Apple Studio和XDR显示器亮度
  "Brave             Chrome-based browser with built-in ad blocking" # 基于Chrome的内置广告拦截浏览器
  "Dropbox           Sync files across computers with ease"          # 轻松在计算机之间同步文件
  "Mainline Kernels  Install newer Linux kernels than Ubuntu defaults" # 安装比Ubuntu默认更新的Linux内核
  "OBS Studio        Record screencasts with inputs from both display + webcam" # 录制屏幕和网络摄像头输入
  "Ollama            Run LLMs, like Meta's Llama3, locally"          # 本地运行大型语言模型，如Meta的Llama3
  "Retroarch         Play retro games"                               # 玩复古游戏
  "Spotify           Stream music from the world's most popular service" # 从最流行的服务流媒体音乐
  "Steam             Play games from Valve's store"                  # 玩Valve商店的游戏
  "VirtualBox        Virtual machines to run Windows/Linux"          # 运行Windows/Linux的虚拟机
  "Zoom              Attend and host video chat meetings"            # 参加和主持视频聊天会议
  "> All             Re-run any of the default installers"           # 重新运行任何默认安装程序
  "<< Back           "                                               # 返回
)

# 使用gum工具显示安装选择菜单
CHOICE=$(gum choose "${CHOICES[@]}" --height 20 --header "Install application")

# 处理用户选择
if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # 如果选择返回或未选择，则不安装任何内容
  echo ""
elif [[ "$CHOICE" == "> All"* ]]; then
  # 如果选择"All"，则允许用户选择任何安装脚本
  INSTALLER_FILE=$(gum file $OMAKUB_PATH/install)

  # 确认并执行选择的安装脚本
  [[ -n "$INSTALLER_FILE" ]] &&
    gum confirm "Run installer?" &&
    source $INSTALLER_FILE &&
    gum spin --spinner globe --title "Install completed!" -- sleep 3
else
  # 提取应用程序名称并转换为小写，替换空格为连字符
  INSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

  # 根据选择的应用程序确定安装脚本路径
  case "$INSTALLER" in
  "dev-editor") INSTALLER_FILE="$OMAKUB_PATH/bin/omakub-sub/install-dev-editor.sh" ;; # 开发编辑器安装脚本
  "dev-language") INSTALLER_FILE="$OMAKUB_PATH/install/terminal/select-dev-language.sh" ;; # 编程语言环境安装脚本
  "dev-database") INSTALLER_FILE="$OMAKUB_PATH/install/terminal/select-dev-storage.sh" ;; # 开发数据库安装脚本
  "ollama") INSTALLER_FILE="$OMAKUB_PATH/install/terminal/optional/app-ollama.sh" ;; # Ollama安装脚本
  *) INSTALLER_FILE="$OMAKUB_PATH/install/desktop/optional/app-$INSTALLER.sh" ;; # 其他应用程序安装脚本
  esac

  # 执行安装脚本并显示进度动画
  source $INSTALLER_FILE && gum spin --spinner globe --title "Install completed!" -- sleep 3
fi

# 清屏并返回Omakub主程序
clear
source $OMAKUB_PATH/bin/omakub
