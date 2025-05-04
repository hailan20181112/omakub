#!/bin/bash
# GNOME扩展安装和配置脚本

# 安装GNOME扩展管理器和pipx（用于安装Python应用程序）
sudo apt install -y gnome-shell-extension-manager pipx
# 安装GNOME扩展命令行工具
pipx install gnome-extensions-cli --system-site-packages

# 关闭Ubuntu默认扩展
gnome-extensions disable tiling-assistant@ubuntu.com        # 禁用Ubuntu平铺助手
gnome-extensions disable ubuntu-appindicators@ubuntu.com    # 禁用Ubuntu应用指示器
gnome-extensions disable ubuntu-dock@ubuntu.com             # 禁用Ubuntu Dock
gnome-extensions disable ding@rastersoft.com                # 禁用桌面图标

# 暂停以确保用户准备好接受确认提示
gum confirm "To install Gnome extensions, you need to accept some confirmations. Ready?"

# 安装新扩展
gext install tactile@lundal.io                              # 安装Tactile窗口管理器
gext install just-perfection-desktop@just-perfection        # 安装Just Perfection（GNOME界面调整）
gext install blur-my-shell@aunetx                           # 安装Blur My Shell（界面模糊效果）
gext install space-bar@luchrioh                             # 安装Space Bar（工作区管理）
gext install undecorate@sun.wxg@gmail.com                   # 安装Undecorate（移除窗口装饰）
gext install tophat@fflewddur.github.io                     # 安装TopHat（系统监视器）
gext install AlphabeticalAppGrid@stuarthayhurst             # 安装字母顺序应用网格

# 编译gsettings架构以便能够设置它们
# 复制各个扩展的架构文件到系统架构目录
sudo cp ~/.local/share/gnome-shell/extensions/tactile@lundal.io/schemas/org.gnome.shell.extensions.tactile.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/just-perfection-desktop\@just-perfection/schemas/org.gnome.shell.extensions.just-perfection.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/blur-my-shell\@aunetx/schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/space-bar\@luchrioh/schemas/org.gnome.shell.extensions.space-bar.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/tophat@fflewddur.github.io/schemas/org.gnome.shell.extensions.tophat.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/AlphabeticalAppGrid\@stuarthayhurst/schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml /usr/share/glib-2.0/schemas/
# 编译架构文件
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# 配置Tactile窗口管理器
gsettings set org.gnome.shell.extensions.tactile col-0 1        # 设置第一列宽度
gsettings set org.gnome.shell.extensions.tactile col-1 2        # 设置第二列宽度
gsettings set org.gnome.shell.extensions.tactile col-2 1        # 设置第三列宽度
gsettings set org.gnome.shell.extensions.tactile col-3 0        # 设置第四列宽度
gsettings set org.gnome.shell.extensions.tactile row-0 1        # 设置第一行高度
gsettings set org.gnome.shell.extensions.tactile row-1 1        # 设置第二行高度
gsettings set org.gnome.shell.extensions.tactile gap-size 32    # 设置窗口间隙大小

# 配置Just Perfection扩展
gsettings set org.gnome.shell.extensions.just-perfection animation 2                # 设置动画速度
gsettings set org.gnome.shell.extensions.just-perfection dash-app-running true      # 显示正在运行的应用指示器
gsettings set org.gnome.shell.extensions.just-perfection workspace true             # 启用工作区
gsettings set org.gnome.shell.extensions.just-perfection workspace-popup false      # 禁用工作区弹出窗口

# 配置Blur My Shell扩展（界面模糊效果）
gsettings set org.gnome.shell.extensions.blur-my-shell.appfolder blur false         # 禁用应用文件夹模糊
gsettings set org.gnome.shell.extensions.blur-my-shell.lockscreen blur false        # 禁用锁屏模糊
gsettings set org.gnome.shell.extensions.blur-my-shell.screenshot blur false        # 禁用截图模糊
gsettings set org.gnome.shell.extensions.blur-my-shell.window-list blur false       # 禁用窗口列表模糊
gsettings set org.gnome.shell.extensions.blur-my-shell.panel blur false             # 禁用面板模糊
gsettings set org.gnome.shell.extensions.blur-my-shell.overview blur true           # 启用概览模糊
gsettings set org.gnome.shell.extensions.blur-my-shell.overview pipeline 'pipeline_default'  # 设置概览模糊管道
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock blur true       # 启用Dash模糊
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock brightness 0.6  # 设置Dash亮度
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock sigma 30        # 设置Dash模糊强度
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock static-blur true # 启用静态模糊
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock style-dash-to-dock 0 # 设置Dash样式

# 配置Space Bar扩展（工作区管理）
gsettings set org.gnome.shell.extensions.space-bar.behavior smart-workspace-names false  # 禁用智能工作区名称
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-activate-workspace-shortcuts false  # 禁用激活工作区快捷键
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-move-to-workspace-shortcuts true    # 启用移动到工作区快捷键
gsettings set org.gnome.shell.extensions.space-bar.shortcuts open-menu "@as []"          # 设置打开菜单快捷键

# 配置TopHat扩展（系统监视器）
gsettings set org.gnome.shell.extensions.tophat show-icons false       # 隐藏图标
gsettings set org.gnome.shell.extensions.tophat show-cpu false         # 隐藏CPU使用率
gsettings set org.gnome.shell.extensions.tophat show-disk false        # 隐藏磁盘使用率
gsettings set org.gnome.shell.extensions.tophat show-mem false         # 隐藏内存使用率
gsettings set org.gnome.shell.extensions.tophat show-fs false          # 隐藏文件系统使用率
gsettings set org.gnome.shell.extensions.tophat network-usage-unit bits # 设置网络使用单位为比特

# 配置AlphabeticalAppGrid扩展（字母顺序应用网格）
gsettings set org.gnome.shell.extensions.alphabetical-app-grid folder-order-position 'end'  # 设置文件夹排序位置为末尾
