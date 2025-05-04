#!/bin/bash
# 编程语言环境卸载脚本

# 卸载编程语言
if [[ -v OMAKUB_FIRST_RUN_LANGUAGES ]]; then
  # 如果已经设置了OMAKUB_FIRST_RUN_LANGUAGES环境变量，则使用它
  languages=$OMAKUB_FIRST_RUN_LANGUAGES
else
  # 否则显示可用的编程语言列表让用户选择要卸载的语言
  AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "PHP" "Python" "Elixir" "Rust" "Java")
  languages=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --height 10 --header "Select programming languages to uninstall")
fi

# 如果选择了至少一种语言
if [[ -n $languages ]]; then
  # 遍历每种选择的语言
  for language in $languages; do
    # 根据语言类型执行相应的卸载命令
    case $language in
    Ruby)
      # 卸载Ruby和Rails
      mise uninstall ruby@3.4
      mise x ruby -- gem uninstall rails
      ;;
    Node.js)
      # 卸载Node.js
      mise uninstall node@lts
      ;;
    Go)
      # 卸载Go
      mise uninstall go@latest
      ;;
    PHP)
      # 卸载PHP及其扩展
      sudo apt -y purge php8.4 php8.4-{curl,apcu,intl,mbstring,opcache,pgsql,mysql,sqlite3,redis,xml,zip}
      # 移除PHP的PPA仓库
      sudo add-apt-repository -y --remove ppa:ondrej/php
      # 删除Composer
      sudo rm /usr/local/bin/composer
      ;;
    Python)
      # 卸载Python
      mise uninstall python@latest
      ;;
    Elixir)
      # 卸载Elixir和Erlang
      mise uninstall elixir@latest
      mise uninstall erlang@latest
      ;;
    Rust)
      # 卸载Rust
      rustup self uninstall -y
      ;;
    Java)
      # 卸载Java
      mise uninstall java@latest
      ;;
    esac
  done
fi
