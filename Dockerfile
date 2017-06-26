FROM ubuntu:16.04

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

RUN apt-get update && \
    apt-get install -y firefox

ARG USER_ID=${USER_ID:-1100}
ARG GROUP_ID=${GROUP_ID:-1100}

ENV USER_ID=${USER_ID}
ENV GROUP_ID=${GROUP_ID}

RUN export uid=${USER_ID} gid=${GROUP_ID} && \
    mkdir -p /home/developer && \
    mkdir -p /etc/sudoers.d && \
    echo "developer:x:${USER_ID}:${GROUP_ID}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${USER_ID}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown developer:developer -R /home/developer
       
USER developer
ENV HOME /home/developer
CMD /usr/bin/firefox
