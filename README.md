# Infrastructure as Code (IaC)
## IAC with Ansible
## Ansible benefits
* Automate provisioning of multiple servers without needing to access each server individually
* Saves costs and time

## Ansibe in DevOps
* Create a VM which can SSH into various servers in order to run provisioning


### Let's create Vagrantfile to create Three VMs for Ansible architecture
#### Ansible controller and Ansible agents 

```

# -*- mode: ruby -*-
 # vi: set ft=ruby :
 
 # All Vagrant configuration is done below. The "2" in Vagrant.configure
 # configures the configuration version (we support older styles for
 # backwards compatibility). Please don't change it unless you know what
 
 # MULTI SERVER/VMs environment 
 #
 Vagrant.configure("2") do |config|
 # creating are Ansible controller
   config.vm.define "controller" do |controller|
     
    controller.vm.box = "bento/ubuntu-18.04"
    
    controller.vm.hostname = 'controller'
    
    controller.vm.network :private_network, ip: "192.168.33.12"
    
    # config.hostsupdater.aliases = ["development.controller"] 
    
   end 
 # creating first VM called web  
   config.vm.define "web" do |web|
     
     web.vm.box = "bento/ubuntu-18.04"
    # downloading ubuntu 18.04 image
 
     web.vm.hostname = 'web'
     # assigning host name to the VM
     
     web.vm.network :private_network, ip: "192.168.33.10"
     #   assigning private IP
     
     #config.hostsupdater.aliases = ["development.web"]
     # creating a link called development.web so we can access web page with this link instread of an IP   
         
   end
   
 # creating second VM called db
   config.vm.define "db" do |db|
     
     db.vm.box = "bento/ubuntu-18.04"
     
     db.vm.hostname = 'db'
     
     db.vm.network :private_network, ip: "192.168.33.11"
     
     #config.hostsupdater.aliases = ["development.db"]     
   end
 
 
 end
```
## Setting up Ansible in Controller VM
* Created provisioning file to automate update and upgrade
* automate installation of ansible and dependencies

## Create Host file within Controller
* `cd /etc/ansible` 
* `rm -rf hosts`
* `sudo nano hosts`
* Ensure nodes are known_hosts within controller VM, achieved by pinging IP of each node.  
* Enter IP adresses of host nodes
```
# add ip address/s of your agent nodes
[web]
192.168.33.10 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
[db]
192.168.33.11 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
```
## Carry out Adhic commands:
* Ping 
  -  `ansible all -m ping` - pings all VM listed in hosts file
  -  `ansible web -m ping`- pings web VM
  -  `ansible db -m ping` - pings db wm

* VM INFO
  - `ansible all -a "uname -a"` - give basic information for all VM listed in hosts file
  - `ansible web -a "uname -a"` - give basic information for db VM
  - `ansible db -a "uname -a"` - give basic information for db VM
  - `ansible all -a "<command>"` will run on all the VM in the hosts file
  - `ansible db -a "ls -a"` shows all files of each VM in the home dir
