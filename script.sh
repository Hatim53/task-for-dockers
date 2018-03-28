#!/bin/bash

#Building Images for Containers
cd container1
echo "Building First Docker Image" 
sudo docker build --tag container1 --build-arg ssh_pub_key="$(cat ~/.ssh/id_rsa.pub)" .
cd ..
cd container2
echo "Building Second Docker Image"
sudo docker build --tag container2 .

#Creating Network 
echo "Creating Docker Network"
sudo docker network create --subnet=172.18.0.0/16 quandoo_network


#Launching Containers using Docker Images with static IP
sudo docker run --net quandoo_network --ip=172.18.0.22 --name container1_instance -i -t -d container1

sudo docker cp container1_instance:/home/docker_root/.ssh/id_rsa.pub /tmp/id_rsa.pub

sudo docker run --net quandoo_network --ip=172.18.0.23 --name container2_instance -i -t -d container2

sudo docker cp /tmp/id_rsa.pub container2_instance:/home/docker_root/.ssh/authorized_keys

sudo docker exec -it container1_instance bash -c "service ssh start"

sudo docker exec -it container2_instance bash -c "chmod 0755 /home/docker_root/.ssh/authorized_keys"

sudo docker exec -it container2_instance bash -c "service ssh start"
