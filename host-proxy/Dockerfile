FROM nginx:1.18-alpine
ENV HOST_SYS linux
ENV PORT_FORWARD_LIST ""
WORKDIR /app
COPY start_proxy.sh stream.conf.template ./
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.original
CMD sh start_proxy.sh