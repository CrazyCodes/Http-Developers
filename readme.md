# .env 配置文件详解
* APPLICATION         PHP项目目录
* NODE_APPLICATION    前端项目目录
* NGINX_VOLUME_CONFIG_PATH      NGINX配置文件目录
* MYSQL_ROOT_PASSWORD 默认数据库root密码
* MYSQL_DATA_PATH     数据库本地映射目录
* JAVA_APPLICATION    JAVA项目目录


# 容器名称列表
MYSQL -> db -> 别名:dev_db
PHP -> php -> 别名:dev_php
NGINX -> web -> 别名:dev_nginx

# start.sh
> 这是写了一个可以快速操作docker环境的脚本，基本使用如下