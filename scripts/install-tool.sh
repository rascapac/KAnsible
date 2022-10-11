#!/bin/bash

# Burp Pro
cd /tmp
wget -O burp "https://portswigger-cdn.net/burp/releases/download?product=pro&type=Linux"
chmod +x burp
./burp -q -dir /opt/burppro/

# BloodHoound
apt install bloodhound
/bin/neo4j start&

#Python 2
#echo 'Install Python2..'
#apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git
#curl https://pyenv.run | bash
#echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
#echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
#echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init --path)"\nfi' >> ~/.zshrc
#exec $SHELL
#pyenv install 2.7.18

# IDA Free
cd /tmp 
wget https://out7.hex-rays.com/files/idafree81_linux.run 
sudo ./idafree81_linux.run --mode unattended  --prefix /opt/ida/
ln -s /opt/ida/ida64 /usr/bin/
