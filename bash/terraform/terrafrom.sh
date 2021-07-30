#!bin/bash
if [ -f /etc/redhat-release ]; then
        sudo yum install wget unzip -y
        sudo wget https://releases.hashicorp.com/terraform/0.15.3/terraform_0.15.3_linux_amd64.zip
        sudo unzip terraform_0.15.3_linux_amd64.zip
        sudo mv terraform /usr/local/bin/
        sudo rm terraform_0.15.3_linux_amd64.zip
fi

if [ -f /etc/lsb-release ]; then
       sudo apt-get install curl -y
       curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
       sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
       sudo apt install terraform -y
fi
