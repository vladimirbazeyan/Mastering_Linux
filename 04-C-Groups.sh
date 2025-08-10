C Groups/ Control Groups

systemd-cgtop

#by default displays 3level of CGroups
#to show more 
systemd-cgtop --depth=5


#limit firefox to use 100 mb
#create file on
~/.config/systemd/user/browser.slice
[Slice]
MemoryHigh=100M

#to Create folder with sybfolder we can use 
mkdir -p ~/.config/systemd/user


#how to use it
systemd-run --user --slice=browser.slice /usr/bin/firefox

#to find path for programm
which firefox

#but it is not a actuall firefox executable
#to find real path lets lunch firefox
#end execut the command 
ps -ef | grep firefox
#output
/snap/firefox/6563/usr/lib/firefox/firefox


#Targets
systemctl get-default 
systemctl cat graphical.target


#to isoalte system for cli interface
systemctl isolate multi-user.target

#to isolate system for graphoical interface
systemctl isolate graphical.target

#we can list available targets
systemctl list-units --type target --all

#set default target
systemctl set-default multi-user.target



####
#systemd: How to enable /desable units
systemctl enable --now apache2.service

#disable is meaning that it is removed from autostart
systemctl disable apache2.service

#to stopq
systemctl stop apache2.service



###
#How we can edit unit files
#we can copy unit files from /lib/systemd/system to /etc/systemd/system
#after wen ned to reload systemd
systemctl daemon-reload

###
#how we can edit unit with systemctl
systemctl edit apache2.service  
#internally, a new folder will be created
    /etc/systemd/system/apache2.service.d 
    #From this folder, override files will be loaded, that can change certain parts of the initial configuration


    #systemctl edit apache2.service is a exdention and extend parameters or configurations
    #to override it first we need to assign parameter an empty string
    #then add assign our value


    