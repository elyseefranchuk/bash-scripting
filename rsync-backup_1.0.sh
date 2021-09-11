#!/bin/bash/sh
#https://github.com/elyseefranchuk

#Best practice is not to hardcode creds
source creds.sh

echo "Connecting to smb drive"
echo "-----------------------"

#Checking if smb is already mounted
if mountpoint -q smbdrive ;
then mount -t cifs -o username=$username,password=$password '\\10.0.0.169\safekeep' /mnt/smbdrive
else echo "smb share is already mounted"
fi

echo "Creating folder for todays backup"
echo "---------------------------------"
folname=$(date +%m-%d-%y)

#Checking if folder already exists (Increment $folname if you want multiple backups every day)
if [ -d /mnt/smbdrive/safekeep/kali-backup/$folname ] ;
then echo "Folder already exists"
     echo "Exiting script"
     exit 1
else mkdir "/mnt/smbdrive/safekeep/kali-backup/$folname"
fi

echo "Backing up home drive"
echo "---------------------"
#rsync -a --info=progress2 /home/.ecryptfs "/mnt/smbdrive/safekeep/kali-backup/$folname"
echo "Finished Backing up"
echo "-------------------"
