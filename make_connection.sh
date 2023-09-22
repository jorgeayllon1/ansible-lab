#!/bin/bash

FILE_KEY=~/.sh/id_rsa_ansible.pub
user=$1
remote_address=$2

if [ ! -f "$FILE" ]; then
    ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa_ansible >/dev/null 2>&1
fi

ssh-copy-id -i ~/.ssh/id_rsa_ansible.pub $user@$remote_address
