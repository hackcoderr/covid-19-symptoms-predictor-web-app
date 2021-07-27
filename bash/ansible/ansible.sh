#!bin/bash
sudo su
sudo yum install python3 -y
sudo pip3 install ansible
sudo mkdir /etc/ansible
sudo mv ansible.cfg /etc/ansible/
sudo mv ip.txt /etc/ansible/
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
sudo yum install sshpass -y
