FROM nginx:1.18-alpine
ENV HOST_SYS linux
ENV PORT_FORWARD_LIST ""
RUN apk add --no-cache bash
WORKDIR /app
COPY start_proxy.sh stream.conf.template ./
CMD bash start_proxy.sh