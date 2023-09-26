#!/bin/bash

FILE_KEY=~/.ssh/id_rsa_ansible.pub
user=$1
remote_address=$2

if ! [ -e "$FILE_KEY" ]; then
    ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa_ansible >/dev/null 2>&1
fi

ssh -q -o BatchMode=yes -i ~/.ssh/id_rsa_ansible ${user}@${remote_address} exit
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
    ssh-copy-id -i ~/.ssh/id_rsa_ansible.pub ${user}@${remote_address}
    ssh -i ~/.ssh/id_rsa_ansible ${user}@${remote_address}
else
    ssh -i ~/.ssh/id_rsa_ansible ${user}@${remote_address}
fi
