#!/bin/bash
# 桌面环境工具安装脚本

# 运行所有桌面环境安装脚本
for installer in ~/.local/share/omakub/install/desktop/*.sh; do source $installer; done

# 询问用户是否准备重启以使所有设置生效
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
