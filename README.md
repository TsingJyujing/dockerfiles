# Dockerfiles
Useful docker images

# Docker Images

## host-proxy

`docker pull tsingjyujing/host-proxy`

Example: 
`docker run -it --rm -p 12345:12345 -e HOST_SYS=mac -e PORT_FORWARD_LIST="27017-12345" tsingjyujing/host-proxy`

Proxy some port from docker's host machine to container's port.

|environment variable|default|comment|
|-|-|-|
|HOST_SYS|linux| win/mac/linux the system of docker host|
|PORT_FORWARD_LIST|-|The port forward config|

The PORT_FORWARD_LIST support proxy multi ports which splits with space.

For example, forward 3306 and 27017 from host to container's 3307 and 27018:

`PORT_FORWARD_LIST="3306-3307 27017-27018"`

