#!/bin/bash

echo 'Do not forget to change the credentials in hosts.ini'
echo "Kill this process if you haven't changed them"
sleep 8

# Run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

sshd='/etc/ssh/sshd_config'
string1=$(cat $sshd | grep PermitRootLogin )
string2=$(cat hosts.ini | grep ansible_user=root)

# If you are deplying it with the root user
if [[ $string2 == *"root"* ]]; then
	echo "Checking "$sshd ".. "
	if [[ $string1 == *"yes"* ]]; then
  		echo "SSH configuration is all set."
	else
  		echo "PermitRootLogin is disabled"
  		echo "Backing up "$sshd ".."
		cp $sshd $sshd.bk
  		echo "Modifying "$sshd ".."
  		sed 's/PermitRootLogin/PermitRootLogin yes#/' $sshd.bk > $sshd
		systemctl restart ssh
	fi
fi

# Deploy
echo 'Configuring Keyboard..'
echo -n 'W0Rlc2t0b3AgRW50cnldCkVuY29kaW5nPVVURi04ClZlcnNpb249MC45LjQKVHlwZT1BcHBsaWNhdGlvbgpOYW1lPW1hY2Zya2V5Ym9hcmQKQ29tbWVudD1tYWNmcmtleWJvYXJkCkV4ZWM9c2V0eGtibWFwIC1tb2RlbCBwYzEwNSAtbGF5b3V0IGZyIC12YXJpYW50IG1hYyAtb3B0aW9uIGx2MzpsYWx0X3N3aXRjaCxjb21wb3NlOmx3aW4KT25seVNob3dJbj1YRkNFOwpSdW5Ib29rPTAKU3RhcnR1cE5vdGlmeT1mYWxzZQpUZXJtaW5hbD1mYWxzZQpIaWRkZW49ZmFsc2U=' | base64 -d > /home/kali/.config/autostart/macfr.desktop
echo -n 'W0Rlc2t0b3AgRW50cnldCkVuY29kaW5nPVVURi04ClZlcnNpb249MC45LjQKVHlwZT1BcHBsaWNhdGlvbgpOYW1lPW1hY2ZyY2hldgpDb21tZW50PW1hY2ZyY2hldgpFeGVjPXhtb2RtYXAgLWUgJ2tleWNvZGUgOTQ9YXQgbnVtYmVyc2lnbiBZZGlhZXJlc2lzIHBlcmlvZGNlbnRlcmVkJyAtZSAna2V5Y29kZSA0OT1sZXNzIGdyZWF0ZXIgVm9pZFN5bWJvbCBWb2lkU3ltYm9sJwpPbmx5U2hvd0luPVhGQ0U7ClJ1bkhvb2s9MApTdGFydHVwTm90aWZ5PWZhbHNlClRlcm1pbmFsPWZhbHNlCkhpZGRlbj1mYWxzZQ==' | base64 -d > /home/kali/.config/autostart/macfrchev.desktop


echo 'Install python-virtualenv and sshpass..'
apt update
apt install libwacom-common
#apt upgrade
apt install software-properties-common -y
sudo apt install python3-pip -y
pip3 install virtualenv
apt install sshpass -y

echo 'Configuring Ansible'
virtualenv ansible
source ansible/bin/activate
pip install ansible

echo 'Installation of the tools'
#ansible-playbook deploy_kali.yml -i hosts.ini 
ansible -i hosts.ini -m ping http1 --user kali --ask pass

# If you are deplying it with the root user
if [[ $string2 == *"root"* ]]; then
	if [[ $string1 == *"yes"* ]]; then
  		echo "All set. Hack the planet!"
	else
		echo "Recovering "$sshd ".."
		# Recover the old sshd_config file
		mv $sshd.bk $sshd
	fi
fi
