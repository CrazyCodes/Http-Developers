#!/bin/bash

#--------------------------------------------
# 
# docker 本地环境操作脚本
# author CrazyCodes
# blog   https://blog.fastrun.com
# 
# sh ./start.sh [service_name] [$2] "[$3]"
##### 参数 #####
# $1 
# 		hosts $2[reload|ls] 
# 			reload 重新加载hosts文件,重载hosts需要sudo
# 			ls     查看host文件
# 		https $2[stop|start|restart]
# 			stop    停止docker-compose服务
# 			start   开启docker-compose服务
# 			restart 重启docker-compose服务
# 		nodes $2[dirname] 输入需要操作的文件夹名称
# 			  $3[command] 输入需要操作的命令
# 			
##### 参数 end #####
set -x

compose='docker-compose'

https_parameters=('stop','start','restart')

case $1 in
	'hosts')
		if [[ $2 == 'reload' ]]; then
			cat ./hosts > /etc/hosts
		elif [[ $2 == 'ls' ]]; then
			cat ./hosts
		else
			echo "no parameters exist : ${2}"
		fi
	;;
	'https')
		$compose $2
	;;
	'nodes')
		docker exec -it local_node /bin/sh -c "cd /var/www/${2} && ${3}"
	;;
	'php')
		docker exec -it local_php /bin/sh -c "cd /mnt/app/${2} && ${3}"
	;;
esac
