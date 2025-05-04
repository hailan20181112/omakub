#!/bin/bash
# GNOME桌面环境设置脚本

# 将新窗口居中显示在屏幕中间
gsettings set org.gnome.mutter center-new-windows true

# 设置Cascadia Mono作为默认等宽字体
gsettings set org.gnome.desktop.interface monospace-font-name 'CaskaydiaMono Nerd Font 10'

# 在GNOME日历中显示周数
gsettings set org.gnome.desktop.calendar show-weekdate true

# 关闭环境光传感器控制屏幕亮度（这些传感器通常工作不正常）
gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false
