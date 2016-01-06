#!/bin/env bash

while [ true ]; do
 #40分钟后锁定屏幕
 sleep 2400
 gnome-screensaver-command -l
 echo  'lock screen' `date +%Y-%m-%d:%H:%M:%S`
 #30秒后黑屏
 sleep 30
 gnome-screensaver-command -a
 echo  'lock screen' `date +%Y-%m-%d:%H:%M:%S`
 #2分钟后亮屏
 sleep 120
 gnome-screensaver-command -d
 echo  'unlock screen' `date +%Y-%m-%d:%H:%M:%S`
done

