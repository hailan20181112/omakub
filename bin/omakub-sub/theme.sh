#!/bin/bash
# Omakub主题设置脚本

# 可用主题列表
THEME_NAMES=("Tokyo Night" "Catppuccin" "Nord" "Everforest" "Gruvbox" "Kanagawa" "Rose Pine")
# 使用gum工具让用户选择主题，并将结果转换为小写并替换空格为连字符
THEME=$(gum choose "${THEME_NAMES[@]}" "<< Back" --header "Choose your theme" --height 10 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

# 如果选择了有效的主题（非空且不是返回选项）
if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then
  # 复制Alacritty终端主题配置
  cp $OMAKUB_PATH/themes/$THEME/alacritty.toml ~/.config/alacritty/theme.toml
  # 复制Zellij终端复用器主题配置
  cp $OMAKUB_PATH/themes/$THEME/zellij.kdl ~/.config/zellij/themes/$THEME.kdl
  # 更新Zellij配置文件中的主题设置
  sed -i "s/theme \".*\"/theme \"$THEME\"/g" ~/.config/zellij/config.kdl
  # 复制Neovim编辑器主题配置
  cp $OMAKUB_PATH/themes/$THEME/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

  # 应用GNOME桌面主题设置
  source $OMAKUB_PATH/themes/$THEME/gnome.sh
  # 应用TopHat系统监视器主题设置
  source $OMAKUB_PATH/themes/$THEME/tophat.sh
  # 应用VSCode编辑器主题设置
  source $OMAKUB_PATH/themes/$THEME/vscode.sh

  # 暂不设置Chrome主题，因为这需要关闭所有基于Chrome的应用，可能会打断用户工作
  # source $OMAKUB_PATH/themes/$THEME/chrome.sh
fi

# 返回主菜单
source $OMAKUB_PATH/bin/omakub-sub/menu.sh
