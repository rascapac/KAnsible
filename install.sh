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
string2=$(cat hosts.ini | grep ansible_user=kali)

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
echo 'Configuring Mac Keyboard..'
echo -n 'IyBLRVlCT0FSRCBDT05GSUdVUkFUSU9OIEZJTEUKCiMgQ29uc3VsdCB0aGUga2V5Ym9hcmQoNSkgbWFudWFsIHBhZ2UuCgpYS0JNT0RFTD0icGMxMDUiClhLQkxBWU9VVD0iZnIiClhLQlZBUklBTlQ9Im1hYyIKWEtCT1BUSU9OUz0ibHYzOmxhbHRfc3dpdGNoLGNvbXBvc2U6bHdpbiIKCkJBQ0tTUEFDRT0iZ3Vlc3MiCg==' | base64 -d > /etc/default/keyboard 

mkdir /home/kali/.config/autostart/
echo -n 'W0Rlc2t0b3AgRW50cnldCkVuY29kaW5nPVVURi04ClZlcnNpb249MC45LjQKVHlwZT1BcHBsaWNhdGlvbgpOYW1lPWZyCkNvbW1lbnQ9bWFjCkV4ZWM9eG1vZG1hcCAtZSAna2V5Y29kZSA5ND1hdCBudW1iZXJzaWduIFlkaWFlcmVzaXMgcGVyaW9kY2VudGVyZWQnIC1lICdrZXljb2RlIDQ5PWxlc3MgZ3JlYXRlciBWb2lkU3ltYm9sIFZvaWRTeW1ib2wnCk9ubHlTaG93SW49WEZDRTsKUnVuSG9vaz0wClN0YXJ0dXBOb3RpZnk9ZmFsc2UKVGVybWluYWw9ZmFsc2UKSGlkZGVuPWZhbHNlCg==' | base64 -d > /home/kali/.config/autostart/fr.desktop


#echo 'Install python-virtualenv and sshpass..'
#apt update
#apt install libwacom-common -y
#apt upgrade
#apt install software-properties-common -y
#sudo apt install python3-pip -y
#pip3 install virtualenv
#apt install sshpass -y

#echo 'Configuring Ansible'
#apt install ansible-core -y
#virtualenv ansible
#source ansible/bin/activate
#pip install ansible

#echo 'Installation of the tools'
#ansible-playbook deploy_kali.yml -i hosts.ini 
#ansible-playbook -i hosts.ini -m ping kali --user kali --ask pass


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
