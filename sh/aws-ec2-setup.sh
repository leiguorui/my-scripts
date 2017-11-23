#!/usr/bin/env bash


####################################   设置账号密码登录   ##########################

1. Login to your EC2 instance using your .pem file

ssh -i your_pem_file.pem ubuntu@ec2-________.compute-1.amazonaws.com
2. Create a new user that will access the instance using a password:

$ sudo useradd -s /bin/bash -m -d /home/USERNAME  -g root USERNAME
where:

-s /bin/bash : use /bin/bash as the standard shell
-m -d /home/USERNAME : create a home directory at /home/USERNAME
-g root : add to group root
USERNAME : the username of the new user


3. Create a strong password for the new user:

$ sudo passwd USERNAME
Enter new UNIX password:
Retype new UNIX password:
4. Add user to sudoers file by using sudo visudo and add the following line:

USERNAME  ALL=(ALL:ALL) ALL
5. Enable password authentication by editing /etc/ssh/sshd_config: change PasswordAuthentication no to PasswordAuthentication yes

6. Restart ssh:

sudo /etc/init.d/ssh restart
Logout of your instance (exit) and try your new login without the .pem file:

$ ssh USERNAME@YOUR_INSTANCE_IP


####################################   设置本地时间   ##########################
#设置时区
sudo timedatectl set-timezone Asia/Shanghai

#设置时间
sudo apt-get install ntpdate
sudo ntpdate ntp.ubuntu.com

####################################   安装mysql   ####################################

sudo apt-get install mysql-server

####远程连接mysql

#Config file changes are required to enable connections via localhost.
#
#To connect through remote IPs, Login as a "root" user and run the below queries in mysql.

mysql -u root -p

CREATE USER 'your_username'@'localhost' IDENTIFIED BY 'your_password';

GRANT ALL PRIVILEGES ON *.* TO 'your_username'@'localhost' WITH GRANT OPTION;

CREATE USER 'your_username'@'%' IDENTIFIED BY 'your_password';

GRANT ALL PRIVILEGES ON *.* TO 'your_username'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;

#This will create a new user that is accessible on localhost as well as from remote IPs.
#
#Also comment the below line from your my.cnf file located in /etc/mysql/my.cnf

#bind-address = 127.0.0.1
#Restart your mysql using

sudo service mysql restart

#Now you should be able to connect remotely to your mysql.

####################################   安装jdk   ####################################

sudo apt-get install default-jdk

####################################   安装git  ####################################

sudo apt-get install git

####################################   安装jdk   ####################################

sudo apt-get install maven

####################################   安装tomcat   ####################################

wget http://mirror.bit.edu.cn/apache/tomcat/tomcat-7/v7.0.82/bin/apache-tomcat-7.0.82.zip
sudo apt-get install unzip
unzip apache-tomcat-7.0.82.zip
sh apache-tomcat-7.0.82/bin/catalina.sh start
