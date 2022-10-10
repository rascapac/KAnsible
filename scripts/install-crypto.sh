#!/bin/bash

#X-RSA
git clone https://github.com/X-Vector/X-RSA.git /home/kali/Tools/crypto
cd /home/kali/Tools/crypto
apt install -y libgmp-dev libmpfr-dev libmpc-dev
pip3 install -r requirement.txt
