#/bin/bash
## a simple bash script for copying a certain directory to a local folder, usb and or to a remote server
## this was mainly used to backup the directory of the frappe-bench sites.
## feel free to comment the part of the code that you don't want to use for backup.

## type the site name that you want to take its backup
## example: site1.local or erpnext_demo
site_name='site1.local'

## The folder in which we take backups from
source_directory=~/frappe-bench/sites/$site_name

## for backup to a local folder ---
## Where to save local backup, Note: this folder must already had been created using mkdir command
local_destination='~/backup_folder'

## for backup to a USB or to HDD ---
## Specify the USB/HDD directory name,Note: The format of the USB must not be FAT32
## this directory must already had been mounted to its corresponding /dev/sdX partition using mount command
usb_mount_directory='/media/USB/'

## backup to a Remote server ---
## change the below to your remote backup server
## ex: ibrahim@192.168.1.30:/home/ibrahim/
## Note: for this to work automatically use ssh-keygen and ssh-copy-id to your remote server first
remote_username='ibrahim'
remote_address='192.168.1.30'
remote_directory='~/'
remote_destination=$remote_username@$remote_address:$remote_directory

#----------------------------------------------------
## running backup to local folder
if [ -d "$local_destination" ]
then
  rsync -rav $source_directory $local_destination

  if [ "$?" -eq "0" ]
  then
    logger -s "rsync4backup LOCAL-OK:rsycn local Copy to $local_destination has been successfully Done"
  else
    logger -s "rsync4backup LOCAL-ERROR:Error while running rsync to LOCAL using rsync_script.sh"
  fi
  
else
  logger -s "rsync4backup LOCAL-ERROR: The $local_destination doesn't exist, please use mkdir"
fi

#----------------------------------------------------
## backup to usb or external Hard Disk
if mount | grep  $usb_mount_directory > /dev/null 
then

  rsync -rav $source_directory $usb_mount_directory
  if [ "$?" -eq "0" ]
  then
    logger -s "rsync4backup USB/HDD-OK: rsycn local Copy to $usb_mount_directory has been successfully Done"
  else
    logger -s "rsync4backup USB/HDD-ERROR:Error while running rsync to USB using rsync_script.sh"
  fi
  
else
  logger "rsync4backup USB/HDD-ERROR:couldnt copy to an external USB drive, check if the device is mounted"
fi

#----------------------------------------------------

## backup to remote Server
if nc -w 2 $remote_address 873 >/dev/null; then

        rsync -rav $source_directory $remote_destination

        if [ "$?" -eq "0" ]
        then
                logger -s "rsync4backup REMOTE-OK: rsycn remote Copy to $remote_destination has been successfully Done"
        else
                logger -s "rsync4backup REMOTE-ERROR: Error while running rsync to REMOTE using rsync_script.sh"
        fi
else
        logger -s "rsync4backup REMOTE-Unreachable: TCP service port 873 on the remote server is unreachable"
fi
