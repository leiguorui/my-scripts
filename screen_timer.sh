#!/bin/env bash

while [ true ]; do
 sleep 2400
 gnome-screensaver-command -a
 echo  'lock screen' `date +%Y-%m-%d:%H:%M:%S`
 sleep 120
 gnome-screensaver-command -d
 echo  'unlock screen' `date +%Y-%m-%d:%H:%M:%S`
done

