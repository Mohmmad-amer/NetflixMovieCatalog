#!/bin/bash

# TODO your deploy script implementation...


pid=$(sudo lsof -i -P -n | grep 8080 |awk 'NR==1 {print $2}')

if [ -n $pid ]; then
    echo "killng process: $pid"
    kill -9 $pid
else
    echo "No process found using port 8080"
fi

cd /home/ubuntu/app
python3 -m venv myenv
source myenv/bin/activate
pip install -r /home/ubuntu/app/requirements.txt
nohup python3 /home/ubuntu/app/app.py > /dev/null 2>&1 &
