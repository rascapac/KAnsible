#!/bin/bash

# Run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi


# Creating Nice folders
mkdir -p /home/kali/{Tools,Pentest,VPN}
mkdir -p /home/kali/Tools/{privesc,crypto,steno}
mkdir -p /home/kali/Tools/privesc/{scanners,bin}

echo 'Install python-virtualenv and sshpass..'
apt update
apt upgrade -y  
apt install software-properties-common -y
apt install python3-pip -y
pip3 install virtualenv
apt install sshpass -y

apt install kali-tools-* -y
apt install golang-go -y
tar -xzf /usr/share/seclists/Passwords/Leaked-Databases/rockyou.txt.tar.gz --directory /usr/share/seclists/Passwords/Leaked-Databases && rm rockyou.txt.tar.gz 

echo 'Install Scripts..'
for i in $(ls scripts); do bash $i; done


echo "All set. Hack the planet!"

cd ..
rm -Rf KAnsible
reboot now