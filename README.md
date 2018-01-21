# frappe-bench-backup-script
This is a simple Bash script used to backup the frappe-bench site | sites into mutliple optional locations:

    1 - To a local folder
  
    2 - To a USB or an HDD 

    3 - To a remote server

The script uses rsync command to do its process.

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

Enjoy your backup!




