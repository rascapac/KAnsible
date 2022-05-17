#!/bin/bash
apt update
apt install feroxbuster -y
apt install seclists -y
tar -xzf /usr/share/seclists/Passwords/Leaked-Databases/rockyou.txt.tar.gz --directory /usr/share/seclists/Passwords/Leaked-Databases && rm rockyou.txt.tar.gz 
apt install golang-go -y
apt install kali-tools-*

# Creating Nice folders
mkdir -p /home/kali/Documents/PrivEsc/{scans,tools}

# traitor
git clone https://github.com/liamg/traitor.git /tmp/traitor
cd /tmp/traitor
make
cp traitor /home/kali/Documents/PrivEsc/tools

# Scanners
curl "https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh" -o /home/kali/Documents/PrivEsc/scans/linpeas.sh 
curl "https://raw.githubusercontent.com/diego-treitos/linux-smart-enumeration/master/lse.sh" -o /home/kali/Documents/PrivEsc/scans/lse.sh
curl "https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh" -o /home/kali/Documents/PrivEsc/scans/LinEnum.sh

