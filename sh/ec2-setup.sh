#!/usr/bin/env bash



########################## 设置本地时间
#设置时区
sudo unlink /etc/localtime
sudo ln -s /usr/share/zoneinfo/Etc/GMT-8 /etc/localtime

#设置时间
sudo apt-get install ntpdate
sudo ntpdate ntp.ubuntu.com


########################## 设置账号密码登录

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

$ ssh USERNAME@ec2-________.compute-1.amazonaws.com
USERNAME@ec2-________.compute-1.amazonaws.com's password: