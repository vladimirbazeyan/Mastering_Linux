echo "${BASH_VERSION}"
# shows top 10 rows of text file
head -n 10 ./romeo.txt

#shows last 10 rows
tail  10 ./romeo.txt 


# less  allows us to read large files
less ./romeo.txt 
	# f scroll on next page
	# 50p 	scrolls 50% of our concepts
	-N #shows numbers od rows
	/ # search from xurrent position
        ? # search vereywhere
	q # quit

#word counts on a file
wc 
	-l 	#number of lines
	-w	#number of words
	-c 	#count number of bytes (=8 bit ASCII-characters)

#disk usage
#du shows disk usage of the current directory and we also can pass parameter to diferent path

du 
	-h #hunab readable

#Write output to a file
>
 #example
	echo "hello bash" > output.txt

# appand to a file
	# if file exist operator should append text
	# if file doesn't extist it should create
>>
  #example
	echo 'Bash is amazing' >> file.txt
	
#redirect standart error
#example
	ls qaq.txt 2> error.txt 
#ignor error message 
# redirect them to /dev/null

du -h image.jpg 2> /dev/null

# redirect stdout and stderr to one file
du -h img-2233.jpg no-image.jpg 1>> out.txt 2>> out.txt
#or
	du -h img-2233.jp no-image.jpg > out.txt 2>&1

#stdin
#standard input
	<
#exmaple
	wc -l < ./romeo.txt
	

#tee
#Copy standard input to each FILE, and also to standard output.
example
	echo "hello world" | tee file.txt

# cut
#Usage: cut OPTION... [FILE]...
#Print selected parts of lines from each FILE to standard output.

#With no FILE, or when FILE is -, read standard input.

cut ./access.log -d ' ' -f 7| sort | uniq



#watch
watch -n 0.5 grep ctxt /proc/12345/status

# processes
ps aux

#niceness priority for processes
#nice -n (-20 - 19 )programm_name lower value has more priorty
nice -n 19 gedit


renice -n 19 [procces id]




#pgrep
#pgrep finds process id
pgrep firefox
#
pgrep -f firefox # shows sub processes


#Signalls
#SIGHUP signalls
kill -9 <process iod>

SIGTERM #tell process to be terminated

examples 
	kill [process ID]
	kill -s SIGTERM [Process ID]
	kill -s 15 [process id]



SIGINT #SIGNAL INTERAPTS



#SIGKILL it is handle by kernell

kill -s SIGKILL [Process ID]
kill -9 [Process ID]
kill -s 9 [Process ID]


#SIGHUP programm hould reload its configuration
kill -s SIGHUP [process id]


#SIGSTOP it is like paused not terminated

kill -s SIGSTOP [process id] #Stop Programm
	
kill -s SIGCONT [process id] #continue programm


#killall kills all process and subprocesses
killlall firefox




##
#last exit code status
#if 0 programm has been closed without errors, if other then 0 the programm has been closed with error
$? 




#nohup
nohup is for backgrounding, it doesnt sent any signall to parrent process to terminate or kill

#PROCESS STATES
(S) sleepin
(D) uninterrptible sleep (when kernel handling to open file for process
(R) Running 
(T) Traced or stopped (may be stopped by kill SIGSTOP [process ID]
(Z) Zombie (when process is closed and has no parrent , doesnt consuming any resources memory or cpu, 


#VIEW SYSYTEM MONITOR
top
	-u [username] # Shows only processes owned by specific username
	-d [secondS]  # set dekay between display updates in secondS		
	-i 			  # Starts top without idle processes
	-c 			  # Display the full command line used to start each process, instead of just the command

#We can also interactivly change the output of the top programm
	f key: 
	#to fillter processes
		we can press the f key to further customization
			use arrows to move on fields
			choose by space key then press q key to go back window

		We can allsow sort by memory or other fields
			moving by arrow to specific field and pressing s key
	k key: 
	#to setnd signalls to processes
		enter [process id]
		enter [signall (SIGKILL or SIGTERM)]
	
	r key:
	#renice the process (change process priority)

	z key: We can switch to color mode, and with uppercase Z key, we can configure itz
	follow the instaraction
	#shift+W to commit configs for further usageq





	#Job Control in bash
#this command will execut process in background
	&

	ping -c 10 ya.ru &

#if we wont to view output in terminal we can jauts redirect it to some file
ping -c 10 ya.ru > ping.txt


#to stop a  job pres ctr+Z keys to stop
	ctrl+z 

# to view jobs enter
	jobs

fg # for forground
bg # for back ground
 exmaple
	1) ping -c 100 yandex.ru > /dev/null 
	2) ctrl+Z
	3) jobs

	#continue  a job in  forground
	fg % [job-ID]
	#continue a job in a background
	bg [job-id]

#terminate job by kill command

#killing the job
kill -s SIGKILL %[job_ID]

#kill by terminate
kill %[job-ID]

#stty is a bash OPTION
#with stty we can start background job untill its creat any output
# -tostop it is will ignor stoping by any output
#Stop jobs with output: stty
example	
	stty tostop
	ping -c 100 google.com &
	jobs



#Waiting for jobs: Waiting
#with wait we can wait for background jobs
	wait
	wait 123
	wait %1

	#waits for any job to be completed
	wait -n
example 
	wait; echo "background jobs has been finished"



#Keep a programm running: nohup
	#We can use nohub command, to lunch a program that will remain open even if we close our terminal	
	nohup ping -c 100 google.com &
	#the standard output will be redirected to nohup.out