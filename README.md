工作中常用的shell脚本
============================

jenkins 自动部署war包
----------------------------

```shell

 #!/bin/bash
 HOST="172.16.0.18"
 USER="cyhzusers"
 FILE="/root/.jenkins/jobs/sirius-builder/workspace/sirius-builder/target/sirius.war"
 REMOTEPATH="/data/ProgramFiles/tianlangxin/webapps"
 REMOTFile="/data/ProgramFiles/tianlangxin/webapps/sirius.zip"

 #备份原来的war包
 ssh 18 -t -t <<End_File_Bak
 cd ${REMOTEPATH}
 if [ -e "sirius.zip" ]; then
     mv sirius.zip $(date +%F-%H:%M).zip
 fi
 exit 0
 End_File_Bak

 #上传新war包
 scp -P 20140 -i ~/.ssh/id_rsa $FILE $USER@$HOST:$REMOTFile

 #部署新war包
 ssh 18 -t -t <<End_File_Deploy
 cd ${REMOTEPATH}
 ../bin/shutdown.sh
 rm -rf sirius/*
 unzip sirius.zip -d sirius
 ../bin/startup.sh
 exit 0
 End_File_Deploy
 exit 0

```
