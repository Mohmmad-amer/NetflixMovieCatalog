#!/bin/bash

# TODO your deploy script implementation...

/home/ubuntu/app

pid=sudo lsof -i -P -n | grep 8080 |awk 'NR==1 {print $2}'

if [ -n "$pid" ]; then
    echo "killng process: $pid"
    kill -9 $pid
else
    echo "No process found using port 8080
fi


nohup python3 /home/ubuntu/app/app.py &