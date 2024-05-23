#!/bin/bash

# TODO your deploy script implementation...


pid=$(sudo lsof -i -P -n | grep 8080 |awk 'NR==1 {print $2}')
if [[ -z $pid ]]; then
    echo "killng process: $pid"
    echo $pid
    kill -9 $pid
else
    echo "No process found using port 8080"
fi

cd /home/ubuntu/app
python3 -m venv myenv
source myenv/bin/activate
pip install -r /home/ubuntu/app/requirements.txt
python3 /home/ubuntu/app/app.py & disown
exit