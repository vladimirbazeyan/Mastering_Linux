#Launch our own programm on boot

#the goal we will creat
#commands that we need 
date +%H #to show howr
date +%I
date +%I%p
date +%I%p:%M
date +%T
date +%m/%d/%Y

date +%T
ping -c 4 google.com

#we can create or example service my-network-log.service
#put it on /etc/systemd/system

#to create service file
#then past the content of my-network-log.service

systemctl edit --force --full my-network-log.service