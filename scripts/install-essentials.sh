#!/bin/bash
apt update
apt install feroxbuster -y
apt install seclists -y
tar -xzf /usr/share/seclists/Passwords/Leaked-Databases/rockyou.txt.tar.gz --directory /usr/share/seclists/Passwords/Leaked-Databases && rm rockyou.txt.tar.gz 
apt install golang-go -y


