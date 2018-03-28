# Docker Containers
It will spin up two dockers containers, user can do ssh from local host machine to container1 and container1 can do ssh to container2 and have auto networking between them.

# Pre-Requiste
You need to have docker and ansible installed on your machine

# Spinning Time
It takes time to spin up, so be patient because the ubuntu image has been used for this ~15 to 20 minutes it takes.

# Action need to take before execute
1) First take a clone of a code.
2) Then you must have your user provided public key on this path /root/.ssh/id_rsa.pub
3) You have docker and ansible installed on your machine.

# Execution 

ansible-playbook -vvvv -i hosts docker.yml --connection=local
