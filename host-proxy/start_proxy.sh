#!/bin/sh

if [ $HOST_SYS == 'linux' ]; then
    HOST_IP=`/sbin/ip route|awk '/default/ { print $3 }'`
    echo "Running in Linux, using host IP: ${HOST_IP}"
else
    HOST_IP=host.docker.internal
    echo "Running in ${HOST_SYS}, using host: ${HOST_IP}"
fi

for i in $PORT_FORWARD_LIST; 
do IFS="-"; 
set -- $i;
    echo "Creating tunnel: host:$1 -> local:$2"
    cat stream.conf.template | HOST_PORT=$1 LOCAL_PORT=$2 HOST_IP="$HOST_IP" envsubst >> /etc/nginx/nginx.conf
done

echo "Starting Nginx"

nginx -g "daemon off;"