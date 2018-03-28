FROM ubuntu:14.04
RUN useradd -ms /bin/bash docker_root
ARG ssh_pub_key
RUN echo $ssh_pub_key
RUN apt-get update
RUN mkdir /home/docker_root/.ssh
RUN apt-get -y install openssh-client
RUN apt-get -y install openssh-server
RUN service ssh start
RUN ssh-keygen -q -t rsa -N '' -f /home/docker_root/.ssh/id_rsa

RUN echo "$ssh_pub_key" > /home/docker_root/.ssh/authorized_keys && \
    chmod 755 /home/docker_root/.ssh/authorized_keys
