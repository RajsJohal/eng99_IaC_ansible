#!/bin/bash

# update and upgrade
sudo apt-get update -y

sudo apt-get upgrade -y

#install ansible

sudo apt-get install software-properties-common

sudo apt-add-repository ppa:ansible/ansible

sudo apt-get update -y

sudo apt-get install ansible -y


# add fingerprint authentication and copy host folder into controller VM
ssh-keyscan -H 192.168.33.10 >> ~/.ssh/known_hosts

ssh-keyscan -H 192.168.33.11 >> ~/.ssh/known_hosts

sudo cp /home/vagrant/controller/hosts /etc/ansible/hosts