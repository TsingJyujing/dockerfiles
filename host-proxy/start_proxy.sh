#!/bin/bash

if [ HOST_SYS == 'linux' ]; then
    HOST_IP=`/sbin/ip route|awk '/default/ { print $3 }'`
else
    HOST_IP=host.docker.internal
fi

for i in $PORT_FORWARD_LIST; 
do IFS="-"; 
set -- $i;
    echo "Creating tunnel: host:$1 -> local:$2"
    cat stream.conf.template | LOCAL_PORT=$2 HOST_IP="$HOST_IP" HOST_PORT=$1 envsubst >> /etc/nginx/nginx.conf
done

nginx -g "daemon off;"
