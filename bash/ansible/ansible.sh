#!bin/bash
# Purpose: installation of Ansible and make the dynamic inventory
# Version:1.0
# Created date:  Sat Jul 17 09:26:58 UTC 2021
# Modified date:
# Author : Sachin Kumar
#
# Step 1: Installing Ansible and configuring it.
#
# Note: try to run this script wth root power to avoid the unwanted issuses.
#
sudo yum install python3 -y
sudo pip3 install ansible
sudo mkdir /etc/ansible
sudo yum install wget -y
sudo wget https://raw.githubusercontent.com/hackcoderr/covid-19-symptoms-predictor-web-app/master/bash/ansible/ansible.cfg
sudo mv ansible.cfg /etc/ansible/
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
sudo yum install sshpass -y
#
# Step 2: Make a dynamic inventory
#
sudo wget https://raw.githubusercontent.com/hackcoderr/covid-19-symptoms-predictor-web-app/master/bash/dynamic_inventory/ec2.py
sudo wget https://raw.githubusercontent.com/hackcoderr/covid-19-symptoms-predictor-web-app/master/bash/dynamic_inventory/ec2.ini
sudo pip3 install boto boto3
#
sudo chmod 777 ec2.py ec2.ini
sudo mv ec2.py ec2.ini /etc/ansible/
#
#
# Note: Replace XXXXXXXXXX with access and secret key.
#
sudo echo aws_access_key_id = AKIAX7LJWBBZ3EFVLW2W >> /etc/ansible/ec2.ini
sudo echo aws_secret_access_key = ELvbBcs9TWH7J9fKj0BdJ1o5MABNjkwpxu/HI/dn >> /etc/ansible/ec2.ini

export AWS_ACCESS_KEY_ID='AKIAX7LJWBBZ3EFVLW2W'
export AWS_SECRET_ACCESS_KEY='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'
