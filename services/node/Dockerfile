FROM ubuntu:latest
MAINTAINER crazycodes <919342864@qq.com>

# 安装必需的软件
RUN apt-get update && apt-get install -y vim python g++ make
RUN mkdir -p /var/tar

# 拷贝node源码包
COPY . /var/tar
WORKDIR /var/tar

# 编译并安装node
RUN tar -zxvf node-v6.11.4.tar.gz && cd node-v6.11.4 && ./configure && make && make install

# 安装pm2
RUN npm install express-generator -g && npm install pm2 -g

VOLUME /var/www

CMD ["bash"]
