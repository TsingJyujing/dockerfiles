#!/bin/bash

# Detect is key dir mounted
if [ -d "/key" ]; then
    echo "Public keys detected:"
    ls -alh /key/*.pub
    cat /key/*.pub > ~/.ssh/authorized_keys 
    echo "Current authorized keys:"
    cat ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
    chmod 700 -R ~/.ssh
    chown $USER:$USER ~/.ssh -R
    # Copy public key to correct folder
    /usr/sbin/sshd -D
else
    echo "/key not found"
    exit 255
fi