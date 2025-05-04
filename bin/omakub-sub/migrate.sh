#!/bin/bash
# Omakub迁移脚本 - 用于更新Omakub并运行必要的迁移

# 切换到Omakub目录
cd $OMAKUB_PATH
# 获取最后更新时间（Unix时间戳格式）
last_updated_at=$(git log -1 --format=%cd --date=unix)
# 从远程仓库拉取最新代码
git pull

# 遍历所有迁移脚本
for file in $OMAKUB_PATH/migrations/*.sh; do
  # 获取文件名（不含路径）
  filename=$(basename "$file")
  # 提取迁移时间戳（移除.sh后缀）
  migrate_at="${filename%.sh}"

  # 如果迁移时间戳大于最后更新时间，则执行该迁移脚本
  if [ $migrate_at -gt $last_updated_at ]; then
    echo "Running migration for $migrate_at"
    source $file
  fi
done

# 返回原目录
cd -
