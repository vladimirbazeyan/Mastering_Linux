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
#Content
    
    [Unit]
    Description=Ping a server and log it
    Requires=network.target
    #After=network-online.target
    [Service]
    Type=oneshot
    StandardOutput=append:/network-log/log.txt
    ExecStart=date '+%%T'
    ExecStart=ping -c 5 google.com
    [Install]


#for a timer create
systenctl edit --force --full my-network-log.timer
#Contect
    [Unit]
    Description=Run the network logging service on boot
    [Timer]
    OnActiveSec=1min
    Unit=my-network-log.service
    [Install]
    WantedBy=timers.target


#starting Timer
systemctl start my-network-log.timer

#IF we add AccuracySec=3sec in [Timer] unit
#each 3 sec kerenel will check

#also we can enable timer and start timer when machine boots

systemctl enable my-network-log.timer

#also we can list timers
systemctl list-timers   


####
#Scheduling Timer Unit to start repitable


systemd-analyze timestamp now
systemd-analyze calendar '*-*-* *:0,15,30,45:30'
# or
    systemd-analyze calendar 'hourly'

#editing our timer unit
systemctl eddit my-network-log.timer
#instand of 
        OnActiveSec=1min
#we are writing 
        OnCalendar='*-*-* *:0,15,30,45:30'

#after we need restart timer
systemctl restart my-network-log.timer


###
#systemd-journald
#journlad is a part of systemd

journalctl #all logs

journalctl -b #shows logs only current boot

journalctl --list-boots #shows all the boots in a specific manar and id

journalctl -b -10 #it shows only boot logs on -10 boot id

journalctl -u <unit> #we can filter by unit

journalctl -u <unit> --since '2025-08-05' --until '2025-08-10'

journalctl -r #recursive

journalctl -f #follwoing current state if any logs will be crated we can track them



#also we can send a message into the journalctl log
echo 'my-message' | systemd-cat -t 'Vladimir' # -t is an identifire


#to filter log by 

journalctl -t 'Vladimir'

#Commment