#!/bin/sh
sudo sh /home/leiguorui/dev/apache-tomcat-7.0.82/bin/startup.sh
read -p "Press enter to continue"
#sudo rm -rf dev/apache-tomcat-7.0.82/webapps/*
#sudo sh dev/apache-tomcat-7.0.82/bin/catalina.sh start
#tail -2000f dev/apache-tomcat-7.0.82/logs/catalina.out


sudo sh dev/apache-tomcat-7.0.82/bin/catalina.sh stop & sudo rm -rf dev/apache-tomcat-7.0.82/webapps/*

sudo sh dev/apache-tomcat-7.0.82/bin/catalina.sh start & tail -2000f dev/apache-tomcat-7.0.82/logs/catalina.out