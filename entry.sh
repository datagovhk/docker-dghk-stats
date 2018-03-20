#!/usr/bin/bash

nohup /usr/sbin/crond 2>&1 &
/usr/sbin/sshd -D
