FROM ubuntu:16.04

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

RUN apt-get update && \
    apt-get install -y firefox

ARG USER_ID=${USER_ID:-1000}
ARG GROUP_ID=${GROUP_ID:-1000}
ARG USER_NAME=${USER_NAME:-developer}

ENV USER_ID=${USER_ID}
ENV GROUP_ID=${GROUP_ID}

RUN export uid=${USER_ID} gid=${GROUP_ID} && \
    mkdir -p /home/${USER_NAME} && \
    mkdir -p /etc/sudoers.d && \
    echo "${USER_NAME}:x:${USER_ID}:${GROUP_ID}:${USER_NAME},,,:/home/${USER_NAME}:/bin/bash" >> /etc/passwd && \
    echo "${USER_NAME}:x:${USER_ID}:" >> /etc/group && \
    echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USER_NAME} && \
    chmod 0440 /etc/sudoers.d/${USER_NAME} && \
    chown ${USER_NAME}:${USER_NAME} -R /home/${USER_NAME}
       
USER ${USER_NAME}
VOLUME /home/${USER_NAME}/data
ENV HOME /home/${USER_NAME}
CMD ["/usr/bin/firefox"]
