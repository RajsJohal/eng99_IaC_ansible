#!/bin/bash

# update and upgrade
sudo apt-get update -y

sudo apt-get upgrade -y

#install ansible

sudo apt-get install software-properties-common

sudo apt-add-repository ppa:ansible/ansible

sudo apt-get update -y

sudo apt-get install ansible -y