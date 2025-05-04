#!/bin/bash
# 字体安装脚本 - 安装系统字体

# 创建用户字体目录
mkdir -p ~/.local/share/fonts

# 切换到临时目录
cd /tmp
# 下载Cascadia Mono Nerd Font（带有编程连字和图标的等宽字体）
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
# 解压字体文件
unzip CascadiaMono.zip -d CascadiaFont
# 复制字体文件到用户字体目录
cp CascadiaFont/*.ttf ~/.local/share/fonts
# 清理临时文件
rm -rf CascadiaMono.zip CascadiaFont

# 下载iA Writer Mono字体（优秀的写作和阅读字体）
wget -O iafonts.zip https://github.com/iaolo/iA-Fonts/archive/refs/heads/master.zip
# 解压字体文件
unzip iafonts.zip -d iaFonts
# 复制字体文件到用户字体目录
cp iaFonts/iA-Fonts-master/iA\ Writer\ Mono/Static/iAWriterMonoS-*.ttf ~/.local/share/fonts
# 清理临时文件
rm -rf iafonts.zip iaFonts

# 更新字体缓存
fc-cache
# 返回原目录
cd -
