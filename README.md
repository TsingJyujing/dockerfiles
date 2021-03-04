# Dockerfiles

![Docker Image CI](https://github.com/TsingJyujing/dockerfiles/workflows/Docker%20Image%20CI/badge.svg)

# Docker Images

## Host Proxy

`docker pull tsingjyujing/host-proxy`

Example: 
`docker run -it --rm -p 12345:12345 -e HOST_SYS=mac -e PORT_FORWARD_LIST="27017-12345" tsingjyujing/host-proxy`

Proxy some port from docker's host machine to container's port.

|environment variable|default|comment|
|-|-|-|
|HOST_SYS|linux| win/mac/linux the system of docker host|
|PORT_FORWARD_LIST|-|The port forward config|

The PORT_FORWARD_LIST support proxy multi ports which splits with space.

For example, if we want to forward 3306 and 27017 from host to container's 3307 and 27018:

`PORT_FORWARD_LIST="3306-3307 27017-27018"`

## MySQL Lite

`docker pull tsingjyujing/mysql-lite:5`

`docker pull tsingjyujing/mysql-lite:8`

MySQL with less memory cost (and worse performance).

### Memory Cost Comparation

|MySQL Version|Default Version|Lite|
|-|-|-|
|5|186M|46M|
|8|325M|99M|


## SSH No Password Login

This a docker image allows you log in by SSH without using password.

Please copy all the public keys (*.pub) to `/key` and you can log in with corresponding private key.