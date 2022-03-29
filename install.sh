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
echo 'Install python-virtualenv and sshpass..'

apt install python-virtualenv sshpass -y

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
