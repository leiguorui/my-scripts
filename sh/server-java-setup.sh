#!/usr/bin/env bash

sudo unlink /etc/localtime
sudo ln -s /usr/share/zoneinfo/Etc/GMT-8 /etc/localtime
date

sudo apt-get install mysql-server
sudo apt-get install mysql-client

sudo apt-get install default-jdk

wget http://mirror.bit.edu.cn/apache/tomcat/tomcat-7/v7.0.82/bin/apache-tomcat-7.0.82.zip
sudo apt-get install unzip
unzip apache-tomcat-7.0.82.zip
sh apache-tomcat-7.0.82/bin/catalina.sh start

