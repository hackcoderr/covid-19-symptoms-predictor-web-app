# Covid-19 symptoms Detector and Predictor Web Application

Before Understanding the configuration of this, let's understand Idea of this [Project](https://docs.google.com/document/d/1R5i9oXPLtodqH0fOKodETXlgYID-WOgQG45665woM4M/edit?usp=sharing).

As it's clear from the name **Covid-19 symptoms Detector and Predictor Web Application using Cloud platforms & MLOps tools**, we am going to create a health-related application with an industry approach. So let's see step by step all my activities for deploying this project in the production environment.

### What We are  going to perform.
I will create this type of architecture to deploy my web app. so let see step by step.
![Alt Text](https://www.canva.com/design/DAEYuceJvBs/Vj8KGdE5dKLp36d2VHwt0A/view?utm_content=DAEYuceJvBs&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink)



## Required knowledge
To create this project, having good knowledge of the following tools and platforms are a prerequisite.
* Terraform
* Cloud Platforms
   * Amazon Web Services (AWS)
   * Microsoft Azure
   * Google Cloud Platform (GCP)
* Ansible
* Kubernetes
* Machine Learning
* Git and Github
* Docker
* Jenkins
* flask

these all tools and platforms will help us how we can automate this project. So let's see the usages of all mentioned staff one by one and why we are using them here. So let's started with terraform.

# Terraform
[Terraform](https://www.terraform.io/) is an open-source infrastructure as a code software tool that provides a consistent CLI workflow to manage hundreds of cloud services. Terraform codifies cloud APIs into declarative configuration files.

### Why we're using Terraform here.
As it's mentioned in the above introduction of *Terraform* that we use this to manage the cloud services So I and my teammates want to use some cloud platforms (AWS, Azure, and GCP) here so that we can create the below-mentioned reproducible infrastructure.
![Terraform  infrastructure](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/s37k5nv4xqs2m4yxjbd2.png)

Now it's time to install the terraform. So let's see its installation.

## Terraform Setup

Run the following group of commands to install the terraform.

Tested on: RHEL, Fedora, Centos and Ubuntu

Note: ``wget`` should be installed.
```terraform script
sudo wget https://raw.githubusercontent.com/hackcoderr/covid-19-symptoms-predictor-web-app/master/bash/terraform/terrafrom.sh
sudo bash terraform.sh
```
Now check to terraform version with ``terraform -version`` command.
![terraform -version](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/ii1264fa9h3ldzffei1l.png)

:warning: Hopefully now it's clear what I am going to do with the help of Terraform as it's clearly mentioned in the above diagram. I'm going to use 2 cloud platforms (AWS and Azure). So let start with AWS Cloud then I will go with Azure.


Before going onward, let me create a workspace where I will save all the things related to this project.
![workspace](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/ityumun4ssxlnk14xe3k.png)

# Amazon Web Services (AWS)
Amazon web service is an online platform that provides scalable and cost-effective cloud computing solutions. It is a broadly adopted cloud platform that offers several on-demand operations like compute power, database storage, content delivery, etc., to help corporates scale and grow.

But if you want to more about it then visit the [link](https://en.wikipedia.org/wiki/Amazon_Web_Services).


## AWS IAM
AWS Identity and Access Management (IAM) is a web service that helps you securely control access to AWS resources. You use IAM to control who is authenticated (signed in) and authorized (has permissions) to use resources.

Now we will need ``access key`` and ``secret key`` for creating VPC and launch AWS instances by terraform tool that why we have to create **AWS IAM User** with ``AmazonVPCFullAccess`` and ``AmazonEC2FullAccess``. So download your IAM credential file.


### Install AWS CLI
Now install AWS CLI in terraform workstation that will help to create making AWS profile and other staff. So if you are using linux then run the below commands and for others os visit the mentioned [link](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)

```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

### Creating AWS Profile
Now  make an AWS CLI profile which we will use in ``aws.tf`` file as a profile. So let's see.

* First of all, login with AWS CLI.

```
aws configure
```
* After running the above command, give your ``access key`` & ``secret key`` which you downloaded during the creating **AWS IAM User**.

![aws configure](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/984ec7wjbdv082nsoojg.png)

* Now run the below command to make the profile and the same is here, give the access and secret key.


```
aws configure --profile profilename
```
![aws profile](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/lbbtvxpj91ste4oocdxc.png)

:warning: Check the profile with the help of the below command.

```
aws configure --list-profiles
```
Now time is to move towards terraform code so make your workspace.
Note: Following mentioned workspace for terraform staff for easy understanding.

``` 
/root/covid-project/terraform/aws/
```
* So create ``aws.tf`` file inside above mentioned and write the below code.

```
provider "aws" {
  region = "ap-south-1"
  profile = "hackcoderr"
}
```
Here you can set any ``region`` at the place ``ap-south-1`` according to your need and give your profile name instead of my profile ``hakcoderr``.

### Initializing terraform code
The ``terraform init`` command is used to initialize a working directory containing Terraform configuration files. This is the first command that should be run after writing a new Terraform configuration or cloning an existing one from version control. It is safe to run this command multiple times. You can initialize using ``terraform init``.

![terraform-init](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/8hs1tmttqc7h73e79nrp.png)

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
