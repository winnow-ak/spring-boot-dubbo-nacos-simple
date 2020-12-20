#!/bin/bash
# 创建 nacos配置存放目录
mkdir -p /opt/docker/nacos/conf  && chown -R 200 /opt/docker/nacos/conf

# 创建 nacos日志存放目录
mkdir -p /opt/docker/nacos/logs  && chown -R 200 /opt/docker/nacos/logs

# 创建 nacos数据存放目录
mkdir -p /opt/docker/nacos/data  && chown -R 200 /opt/docker/nacos/data

#开发nacos端口
firewall-cmd --zone=public --add-port=8848/tcp --permanent
firewall-reload

#下载nacos.sql 并执行 需要mysql 执行
#https://github.com/alibaba/nacos/blob/master/config/src/main/resources/META-INF/nacos-db.sql

#启动nacos
docker run -d -p 8848:8848 \
--name nacos \
--env MODE=standalone \
--env SPRING_DATASOURCE_PLATFORM=mysql \
--env MYSQL_SERVICE_HOST=${服务器数据库}ip \
--env MYSQL_SERVICE_PORT=3306 \
--env MYSQL_SERVICE_DB_NAME=nacos_config \
--env MYSQL_SERVICE_USER=root \
--env MYSQL_SERVICE_PASSWORD=123456 \
-v /opt/docker/nacos/conf:/var/nacos/conf \
-v /opt/docker/nacos/logs:/var/nacos/logs \
-v /opt/docker/nacos/data:/var/nacos/data \
nacos/nacos-server:latest

#docker logs nacos  查看启动日志
#验证nacos启动是否成功
#访问http://服务器ip:8848/nacos/index.html
#账号密码默认:nacos/nacos