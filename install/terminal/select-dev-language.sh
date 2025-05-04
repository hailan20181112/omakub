#!/bin/bash
# 编程语言环境选择和安装脚本

# 安装默认编程语言
if [[ -v OMAKUB_FIRST_RUN_LANGUAGES ]]; then
  # 如果已经设置了OMAKUB_FIRST_RUN_LANGUAGES环境变量，则使用它
  languages=$OMAKUB_FIRST_RUN_LANGUAGES
else
  # 否则显示可用的编程语言列表让用户选择
  AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "PHP" "Python" "Elixir" "Rust" "Java")
  languages=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --height 10 --header "Select programming languages")
fi

# 如果选择了至少一种语言
if [[ -n "$languages" ]]; then
  # 遍历每种选择的语言
  for language in $languages; do
    # 根据语言类型执行相应的安装命令
    case $language in
    Ruby)
      # 安装最新版本的Ruby
      mise use --global ruby@latest
      # 安装Rails框架
      mise x ruby -- gem install rails --no-document
      ;;
    Node.js)
      # 安装长期支持版本的Node.js
      mise use --global node@lts
      ;;
    Go)
      # 安装最新版本的Go
      mise use --global go@latest
      ;;
    PHP)
      # 添加PHP的PPA仓库
      sudo add-apt-repository -y ppa:ondrej/php
      # 安装PHP 8.4及其扩展
      sudo apt -y install php8.4 php8.4-{curl,apcu,intl,mbstring,opcache,pgsql,mysql,sqlite3,redis,xml,zip}
      # 下载Composer安装脚本
      php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
      # 安装Composer并移动到系统目录
      php composer-setup.php --quiet && sudo mv composer.phar /usr/local/bin/composer
      # 清理安装脚本
      rm composer-setup.php
      ;;
    Python)
      # 安装最新版本的Python
      mise use --global python@latest
      ;;
    Elixir)
      # 安装最新版本的Erlang（Elixir的运行时环境）
      mise use --global erlang@latest
      # 安装最新版本的Elixir
      mise use --global elixir@latest
      # 安装Hex包管理器
      mise x elixir -- mix local.hex --force
      ;;
    Rust)
      # 使用官方安装脚本安装Rust
      bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" -- -y
      ;;
    Java)
      # 安装最新版本的Java
      mise use --global java@latest
      ;;
    esac
  done
fi
