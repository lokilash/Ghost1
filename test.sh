#!/bin/sh
a=`df -h |grep -vE '^Filesystem|tmpfs|cdrom' | grep "/var/backup" | awk '{print $5}' | sed 's/\%//g' `
if [ $a -gt 0 ]; then
  rsync -avhr /var/backup root@192.168.56.102:/var/ghost
fi
if [ $? -eq 0 ]; then
  rm -rf /var/backup/*
fi

#testing
