#!/bin/bash

# traitor
git clone https://github.com/liamg/traitor.git /tmp/traitor
cd /tmp/traitor
make
cp traitor /home/kali/Tools/privesc/bin

# Scanners
curl "https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh" -o /home/kali/Tools/privesc/scanners/linpeas.sh 
curl "https://raw.githubusercontent.com/diego-treitos/linux-smart-enumeration/master/lse.sh" -o /home/kali/Tools/privesc/scanners/lse.sh
curl "https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh" -o /home/kali/Tools/privesc/scanners/LinEnum.sh
