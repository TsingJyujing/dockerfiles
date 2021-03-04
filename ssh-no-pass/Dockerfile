FROM ubuntu:18.04
RUN apt update && \
    apt install openssh-server netcat -y && \
    mkdir /var/run/sshd && \
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    sed -ri 's/^#?AuthorizedKeysFile\s+.*/AuthorizedKeysFile .ssh\/authorized_keys/g' /etc/ssh/sshd_config && \
    mkdir /root/.ssh && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY startup.sh /startup.sh
VOLUME /data
VOLUME /key
EXPOSE 22
CMD ["/bin/bash", "/startup.sh"]
