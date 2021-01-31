## 平台简介

模拟小米商场的一个网站 前端有用户端和后台管理员端 后台只有一个

用户端（vue-store-master）       测试用户 账号weoc123      密码weoc123（可以自己注册 或后台添加）
后台管理员端（store-admin-ui）  系统管理员  账号admin       密码admin123
 
* 前端采用Vue、Element UI。
* 后端采用Spring Boot Redis & Jwt等。

## 启动
### 启动redis和前端工程
进入 store 目录下 cmd打开终端（IDEA等工具可以直接打开）
store—>   
start.bat                             ---运行start.bat  window脚本

### 启动后端工程
store-admin 项目下
启动 StoreApplication 类

## 功能

## 部署
edis 运行和安装

基础镜像 jre

mysql数据库

create user`storeAdmin`@`*` identified by'123456';

grant all privileges on *.* to storeAdmin@'%' identified by '123456';

CREATE DATABASE IF NOT EXISTS storedb DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
Navicat Premium 15-->导入sql

后端项目
本地mavn 打包
mvn clean package 
上传jar包
运行dockerfile
systemctl start docker
systemctl start redis
java -jar store-admin.jar
docker build -t store/admin .
docker run -p 8888:8888   -d store/admin
sudo docker login --username=babaaliyum registry.cn-hangzhou.aliyuncs.com
sudo docker push registry.cn-hangzhou.aliyuncs.com/jiabinli/store-admin-ui
sudo docker pull registry.cn-hangzhou.aliyuncs.com/jiabinli/store-admin-ui



docker commit
docker push
docker run

后端打包
nginx

