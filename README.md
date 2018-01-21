# backup-script
This is a simple Bash script used to copy files or directories to different locations, it was mainly used to backup frappe-bench site or sites into mutliple optional locations, but it could also be used for any different applications

rsync4backup script can be used to copy/transfere files to the following:

    1 - To a local folder
  
    2 - To a USB or an HDD 

    3 - To a remote server

rsync4backup uses rsync to do its process.
#
### Before you backup to a local folder
- make sure to have your local folder created before you run the script,
the script doesn't create a backup_folder by default
#
### Before you backup to a USB or to HDD
- make sure that the filesystem of the attached USB/HDD is not FAT32, otherwise you will face an Error message because of permission issues

- make sure to have your USB/HDD mounted to /media/ directory
#
### Before you backup to a Remote Server
- make sure to have your remote server reachable and the TCP port 873 state is OPEN or LISTENING, the script will log REMOTE-ERROR to the /var/log/syslog if the server or the TCP port is unreachable.

- check your firewall setting if you couldn't reach port 873 from your main server.

- for automation purpose it is better to have your main server able to ssh the backup server without requiring the password, you could achieve this feature by using ssh-keygen and ssh-copy-id on the main server

example:

    user@main-server$ ssh-keygen 

    <Just type Enter Enter Enter>

    user@main-server$ ssh-copy-id <username>@<remote-ip-address>

### How to run the Code
Please change the below values to match your criteria and update the script accordingly, 
as example, if you are willing to backup your file (ex: site1.local) to a remote server that has an ip address of 10.1.2.3, then change the remote_address to be remote_address='10.1.2.3', Please dont leave a space between the varaible and the value like this remote_address = '10.1.1.1' otherwise the script will not run as supposed to .

- comment on the lines that you are not interrested in for your backup procedure

    site_name='site1.local'

    local_destination=~/backup_folder

    usb_mount_directory=/media/USB

    remote_username='ibrahim'

    remote_address='192.168.1.123'

    remote_directory='~/'

- Make sure that you type the command "chmod a+x rsync4backup.sh" for the script to be executable.

- To execute the script, go to the directory that has this script and type the below:

    sh rsync4script.sh 


#### Where logs are stored
In case the script ran successfully or had some errors, you will find logs stored on your /var/log/syslog directory, the logs looks like the following

- in case of a successful backup to a local folder the log starts with:

    rsync4backup LOCAL-OK:

- in case of a successful backup to a Remote Server the log starts with:

    rsync4backup REMOTE-OK:

- in case of a successful backup to a USB or to HDD the log starts with:

    rsync4backup USB-HDD-OK:

- in case of an Error when backup to a local folder the log starts with:

    rsync4backup LOCAL-ERROR:

- in case of an Error when backup to a USB or to HDD  the log starts with:

    rsync4backup USB-HDD-ERROR:

- in case of an Error when backup to a Remote Server the log starts with:

    rsync4backup REMOTE-ERROR:
#
### How to schedual the script
To make this code running on a schedulled data or time, you need to have crontab installed.

To add a schedual; type:

    crontab -e

Now you need to add the schedualed date/time that you want, as example to run this script every 6 hours you add the below line

    * */6 * * * /home/\<usernname>/\<script-directory>

#
i hope every thing is clear now

Enjoy your backup!




