# Covid-19 symptoms Detector and Predictor Web Application

Before Understanding the configuration of this, let's understand Idea of this [Project](https://github.com/hackcoderr/images/blob/master/major_project-art.jpg).

As it's clear from the name **Covid-19 symptoms Detector and Predictor Web Application using Cloud platforms & MLOps tools**, we am going to create a health-related application with an industry approach. So let's see step by step all my activities for deploying this project in the production environment.

### What We are  going to perform.
I will create this type of architecture to deploy my web app. so let see step by step.
![Alt Text](https://www.canva.com/design/DAEYuceJvBs/Vj8KGdE5dKLp36d2VHwt0A/view?utm_content=DAEYuceJvBs&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink)



## Required knowledge
To create this project, having good knowledge of the following tools and platforms are a prerequisite.
* Terraform
* Cloud Platforms
   * Amazon Web Services (AWS)
* Ansible
* Kubernetes
* Machine Learning
* Git and Github
* Docker
* Jenkins
* flask

Now perform all the steps one by one and follow mentioned staff according. 


## Terraform and AWS CLI Installation
**Tested on:**
 
![RHEL](https://img.shields.io/badge/Red%20Hat-EE0000?style=for-the-badge&logo=redhat&logoColor=white)
![centos](https://img.shields.io/badge/Cent%20OS-262577?style=for-the-badge&logo=CentOS&logoColor=white)
![amazon](https://img.shields.io/badge/Amazon_Linux-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)

Install and configure terraform and AWS CLI through script.

```
chmod +x bash/terraform/terraform.sh
```
## Provisioning AWS resources
Provision AWS Resources like EC2 instance VPC component etc which we will have need to deploy this application.

Create [IAM User](https://www.techtarget.com/searchcloudcomputing/tutorial/Step-by-step-guide-on-how-to-create-an-IAM-user-in-AWS) for getting accees and secret key which we will use to estabish the connection b/w terraform and AWS Account.

Run the below command to set your aws profile which we will use in terraform code so give your access and secret key after running this command.

```
aws configure --profile <profile-name>
# aws configure --profile hackcoderr
```
Go inside ``./terraform`` folder and run the below commands to get required AWS resources.

```
cd terraform/
terraform init
terraform apply --auto-approve
```
## Ansible Installation
**Tested on:**

![RHEL](https://img.shields.io/badge/Red%20Hat-EE0000?style=for-the-badge&logo=redhat&logoColor=white)
![centos](https://img.shields.io/badge/Cent%20OS-262577?style=for-the-badge&logo=CentOS&logoColor=white)
![ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![amazon](https://img.shields.io/badge/Amazon_Linux-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)

Run the below command to install and configure Ansible.
```
sudo yum install python3 git -y    
git clone https://github.com/hackcoderr/ansible-setup.git
cd ansible-setup/
python3 script.py
```
For more information, Please go through [Ansible Setup Repository](https://hackcoderr.github.io/ansible-setup/).

## Install K8S cluster and Jenkins server throgh Ansible
Go inside ``./ansible/`` and run below ansible playbook to install and configure Jenkins and Docker Swarm according. 

### Install Docker
Path: ``./ansible/kube-cluster/``

Before running playbook please changes your ``hosts`` according to your ``instance tag``.
```
- hosts: <instance_tag_name>
eg:
- hosts: tag_Name_k8s-master
```
Run the ansible playbook to setup K8S cluster
```
ansible-playbook hostname.yml
ansible-playbook dependencies.yml 
ansible-playbook control-plane.yml
ansible-playbook workers.yml
```
### Install Jenkins
Path: ``./ansible/jenkins/``

Before running playbook please changes your ``hosts`` according to your ``instance tag``.
```
- hosts: <instance_tag_name>
eg:
- hosts: tag_Name_Jenkins
```
Run the ansible playbook to install docker swarm.
```
ansible-playbook jenkins.yml
```
type on brower ``Jenkins_server_IP:8080`` and then follow the instructions which are mentioned on jenkins first page and then chnage the password.

### Train the Machine learning model
This model is trained on colab and code is mentioned [here](./ml/covid_detection.ipynb).

### Build web application
Now build the web application using this trained ml model through flask. so flask code is mentioned [here](./flask/app.py)

### Build the Docker image

build the docker image using dockerfile.
```
docker build -t hackcoderr/covid-app:latest .
```




