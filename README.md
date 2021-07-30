# Covid 19 symptoms predictor web application on the multi-clouds using MLOps tools


## Ansible Setup

Run the mentioned script that will help you to installation of Ansible and make the dynamic inventory.

Tested on: ![RHEL 8](https://img.shields.io/badge/RHEL-8-294172?style=for-the-badge&logo=redhat&logoColor=White)

```ansible script
sudo yum install wget -y
sudo wget https://raw.githubusercontent.com/hackcoderr/covid-19-symptoms-predictor-web-app/master/bash/ansible/ansible.sh
sudo bash ansible.sh
```

## Terraform Setup

Run the following group of commands to install the terraform.

Tested on: RHEL, Fedora, Centos and Ubuntu

Note: ``wget`` should be installed.
```terraform script
sudo wget https://raw.githubusercontent.com/hackcoderr/covid-19-symptoms-predictor-web-app/master/bash/terraform/terrafrom.sh
sudo bash terraform.sh
```
