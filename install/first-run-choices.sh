#!/bin/bash
# 首次运行选择脚本 - 让用户选择要安装的应用程序、编程语言和数据库

# 仅在运行GNOME桌面环境时询问默认桌面应用选择
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # 可选应用列表
  OPTIONAL_APPS=("1password" "Spotify" "Zoom" "Dropbox")
  # 默认选择的应用
  DEFAULT_OPTIONAL_APPS='1password,Spotify,Zoom'
  # 使用gum工具让用户选择应用，并将结果导出为环境变量
  export OMAKUB_FIRST_RUN_OPTIONAL_APPS=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit --selected $DEFAULT_OPTIONAL_APPS --height 7 --header "Select optional apps" | tr ' ' '-')
fi

# 可用编程语言列表
AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "PHP" "Python" "Elixir" "Rust" "Java")
# 默认选择的编程语言
SELECTED_LANGUAGES="Ruby on Rails","Node.js"
# 使用gum工具让用户选择编程语言，并将结果导出为环境变量
export OMAKUB_FIRST_RUN_LANGUAGES=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --selected "$SELECTED_LANGUAGES" --height 10 --header "Select programming languages")

# 可用数据库列表
AVAILABLE_DBS=("MySQL" "Redis" "PostgreSQL")
# 默认选择的数据库
SELECTED_DBS="MySQL,Redis"
# 使用gum工具让用户选择数据库，并将结果导出为环境变量
export OMAKUB_FIRST_RUN_DBS=$(gum choose "${AVAILABLE_DBS[@]}" --no-limit --selected "$SELECTED_DBS" --height 5 --header "Select databases (runs in Docker)")
