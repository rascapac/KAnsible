#!/bin/bash

# Burp Pro
cd /tmp
wget -O burp "https://portswigger-cdn.net/burp/releases/download?product=pro&type=Linux"
chmod +x burp
./burp -q -dir /opt/burppro/

# BloodHoound

apt install bloodhound
/bin/neo4j start&

