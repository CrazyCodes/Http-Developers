set -x

docker exec -it local_php /bin/sh -c "cd /mnt/app/${1} && ${2}"