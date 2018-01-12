set -x

docker exec -it dev_php /bin/sh -c "cd /mnt/app/${1} && ${2}"