# backup-script
This is a simple Bash script used to copy files or directories to different locations, it was mainly used to backup frappe-bench site or sites into mutliple optional locations, but it could also be used for any different applications

rsync4backup script can be used to copy/transfere files to the following:

    1 - To a local folder
  
    2 - To a USB or an HDD 

    3 - To a remote server

rsync4backup uses rsync to do its process.

# copying to a local folder
- make sure to have your local folder created before you run the script,
the script doesn't create a backup_folder by default

## copying to USB or to HDD
- make sure that the filesystem of the attached USB/HDD is not FAT32, otherwise you will face an Error message because of permissino issues

- make sure to have your USB/HDD mounted to /media/ directory

### copying to Remote Server
- make sure to have your remote server reachable and the TCP port 873 is open, the script will log REMOTE-ERROR to the /var/log/syslog if the server or the TCP port is unreachable.

- check your firewall setting if you couldn't reach port 873 from your main server.

- for automation purpose it is better to have your main server able to ssh the backup server without requiring the password, you could achieve this feature by using ssh-keygen and ssh-copy-id 

example:

\$ssh-keygen 
\<Just type Enter Enter Enter>

\$ssh-copy-id <username>@<remote-ip-address>

#

Please change the below values to match your criteria and update the script accordingly, 
as example, if you are willing to backup your file (ex: site1.local) to a remote server that has an ip address of 10.1.2.3, then change the remote_address to be remote_address='10.1.2.3' and so on.

comment on the lines that you are not interrested in for your backup procedure

site_name='site1.local'

local_destination=~/backup_folder

usb_mount_directory=/media/USB

remote_username='ibrahim'

remote_address='192.168.1.123'

remote_directory='~/'

#
Make sure that you type the command "chmod a+x rsync4backup.sh" to be able to execute the code

#
To execute the script, go to the directory that has the script and type the below:

sh rsync4script.sh 

# 
In case the script ran successfully or had some errors, you will find logs stored on your /var/log/syslog directory, the logs starts with 

rsync4backup LOCAL-OK:

rsync4backup REMOTE-OK:

rsync4backup USB-HDD-OK:

rsync4backup LOCAL-ERROR:

rsync4backup USB-HDD-ERROR:

rsync4backup REMOTE-ERROR:

# How to schedual the script
To make this code running on a schedulled data or time, you need to have crontab installed.

To add a schedual; type:

crontab -e

Now you need to add the schedualed date/time that you want, as example to run this script every 6 hours you add the below line

 \* */6 * * * /home/\<usernname>/\<script-directory>


i hope every thing is clear now

Enjoy your backup!




