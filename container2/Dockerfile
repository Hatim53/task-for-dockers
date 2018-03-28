FROM ubuntu:14.04
RUN useradd -ms /bin/bash docker_root
RUN mkdir /home/docker_root/.ssh

RUN apt-get update
RUN apt-get -y install openssh-server
RUN service ssh start



