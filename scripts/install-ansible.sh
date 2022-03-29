#!/bin/bash
sudo apt-get update -y
sudo apt install python3-pip -y
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
#SSH
sudo apt-get -y install sshpass
