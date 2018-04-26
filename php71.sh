set -x

docker exec -it dev_php_71 /bin/sh -c "cd /mnt/app/${1} && ${2}"