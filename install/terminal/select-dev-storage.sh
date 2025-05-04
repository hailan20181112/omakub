#!/bin/bash
# 开发数据库选择和安装脚本 - 使用Docker容器运行数据库

# 安装默认数据库
if [[ -v OMAKUB_FIRST_RUN_DBS ]]; then
	# 如果已经设置了OMAKUB_FIRST_RUN_DBS环境变量，则使用它
	dbs=$OMAKUB_FIRST_RUN_DBS
else
	# 否则显示可用的数据库列表让用户选择
	AVAILABLE_DBS=("MySQL" "Redis" "PostgreSQL")
	dbs=$(gum choose "${AVAILABLE_DBS[@]}" --no-limit --height 5 --header "Select databases (runs in Docker)")
fi

# 如果选择了至少一种数据库
if [[ -n "$dbs" ]]; then
	# 遍历每种选择的数据库
	for db in $dbs; do
		# 根据数据库类型启动相应的Docker容器
		case $db in
		MySQL)
			# 启动MySQL 8.4容器，允许空密码，映射到本地3306端口
			sudo docker run -d --restart unless-stopped -p "127.0.0.1:3306:3306" --name=mysql8 -e MYSQL_ROOT_PASSWORD= -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql:8.4
			;;
		Redis)
			# 启动Redis 7容器，映射到本地6379端口
			sudo docker run -d --restart unless-stopped -p "127.0.0.1:6379:6379" --name=redis redis:7
			;;
		PostgreSQL)
			# 启动PostgreSQL 16容器，使用trust认证方式，映射到本地5432端口
			sudo docker run -d --restart unless-stopped -p "127.0.0.1:5432:5432" --name=postgres16 -e POSTGRES_HOST_AUTH_METHOD=trust postgres:16
			;;
		esac
	done
fi
