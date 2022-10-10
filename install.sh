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

apt update
apt upgrade -y  
apt install kali-tools-* -y
apt install golang-go -y
tar -xzf /usr/share/seclists/Passwords/Leaked-Databases/rockyou.txt.tar.gz --directory /usr/share/seclists/Passwords/Leaked-Databases && rm rockyou.txt.tar.gz 

echo 'Install Scripts..'
for i in $(ls scripts); do bash $i; done

echo 'Install python-virtualenv and sshpass..'
apt install software-properties-common -y
apt install python3-pip -y
pip3 install virtualenv
apt install sshpass -y

echo 'Install Python2..'
apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git
curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init --path)"\nfi' >> ~/.zshrc
exec $SHELL
pyenv install 2.7.18

echo "All set. Hack the planet!"

cd ..
rm -Rf KAnsible
reboot now