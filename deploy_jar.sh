#!/bin/bash
HOST="172.16.0.18"
USER="cyhzusers"
FILE="/root/.jenkins/jobs/sct_vip_stat/workspace/target/sct_vip_stat.jar"
FILELib="/root/.jenkins/jobs/sct_vip_stat/workspace/target/sct_vip_stat_lib"
REMOTEPATH="/data/ProgramFiles/sct_vip_stat"
PID_PATH="/home/sct_vip_stat/pid.txt"

#备份原来的jar包
ssh 18 -t -t <<End_File_Bak
cd /data/ProgramFiles/sct_vip_stat
if [ -e "sct_vip_stat.jar" ]; then
    mv sct_vip_stat.jar $(date +%F-%H:%M).jar
fi
exit 0
End_File_Bak

#上传新的jar包和其依赖
scp -P 20140 -i ~/.ssh/id_rsa $FILE $USER@$HOST:$REMOTEPATH
scp -P 20140 -i ~/.ssh/id_rsa -rp $FILELib $USER@$HOST:$REMOTEPATH

#部署新的jar包
ssh 18 -t -t <<End_File_Deploy
#停止jar包对应的线程
jps -lV | grep sct_vip_stat.jar | cut -d ' ' -f 1 | xargs -rn1 kill
rm -f ${PID_PATH}

function_start (){
    nohup java -Dlog.debug="false" -Dlog.path="/home/sct_vip_stat/" -jar sct_vip_stat.jar -Dnetty_port="8141" >> /home/sct_vip_stat/nohup.out &
    echo $! > ${PID_PATH}
}

cd /data/ProgramFiles/sct_vip_stat
function_start
exit 0
End_File_Deploy
exit 0