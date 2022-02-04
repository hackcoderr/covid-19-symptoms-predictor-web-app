
// Provide Credentials
	provider "aws" {
	  region = "ap-south-1"
	  profile = "covid-19"
	}


// variable section
	variable "environment_tag" {
	  description = "Environment tag"
	  default = "Production"
	}


// Creating VPC
	resource "aws_vpc" "vpc" {
	  cidr_block       = "192.168.0.0/16"
	  instance_tenancy = "default"
	  enable_dns_support   = "true"
	  enable_dns_hostnames = "true"
	  tags = {
	    Name = "covid-vpc"
	    Environment = "${var.environment_tag}"
	  }
	}
	
// Creating Subnets
	resource "aws_subnet" "subnet-1a" {
	  vpc_id     = aws_vpc.vpc.id
	  cidr_block = "192.168.0.0/24"
	  availability_zone = "ap-south-1a"
	  map_public_ip_on_launch = "true"
	

	  tags = {
	    Name = "covid-sunbet"
	    Environment = "${var.environment_tag}"
	  }
	}


//Creating Internet Gateway
	resource "aws_internet_gateway" "gw" {
	  vpc_id = aws_vpc.vpc.id
	

	  tags = {
	    Name = "covid-internet-gateway"
	  }
	}
	

	// Creating Route Table
	resource "aws_route_table" "route_table" {
	  vpc_id = aws_vpc.vpc.id
	

	  route {
	

	gateway_id = aws_internet_gateway.gw.id
	    cidr_block = "0.0.0.0/0"
	  }
	

	    tags = {
	    Name = "covid-route-table"
	  }
	}


// Route Table Association
	resource "aws_route_table_association" "route-association" {
	  subnet_id      = aws_subnet.subnet-1a.id
	  route_table_id = aws_route_table.route_table.id
	}
	

	# creating a security group
	resource "aws_security_group" "SG" {
	  name = "covid-SG"
	  vpc_id = "${aws_vpc.vpc.id}"
	  ingress {
	      from_port   = 0
	      to_port     = 0
	      protocol    = "-1"
	      cidr_blocks = ["0.0.0.0/0"]
	  }
	

	 egress {
	    from_port   = 0
	    to_port     = 0
	    protocol    = "-1"
	    cidr_blocks = ["0.0.0.0/0"]
	  }
	  tags ={
	    Environment = "${var.environment_tag}"
	    Name= "covid-SG"
	  }
	

	}
	

	/*
	# launching instance 
	resource "aws_instance" "AWS-covid-instance" {
	  ami    = "ami-0a9d27a9f4f5c0efc"
	  count  = "3"
	  instance_type = "t2.micro"
	  subnet_id = "${aws_subnet.subnet-1a.id}"
	  vpc_security_group_ids = ["${aws_security_group.SG.id}"]
	  key_name = "key"
	 tags ={
	    Environment = "${var.environment_tag}"
	    Name= "AWS-covid-Instance"
	  }
	
	}
	
	
	resource "aws_instance" "Ansible_Controller_Node" {
	  ami           = "ami-0a9d27a9f4f5c0efc"
	  instance_type = "t2.micro"
	  subnet_id = "${aws_subnet.subnet-1a.id}"
	  vpc_security_group_ids = ["${aws_security_group.SG.id}"]
	  key_name = "key"
	 tags ={
	    Environment = "${var.environment_tag}"
	    Name= "Ansible_Controller_Node"
	  }
	
	}
	*/
	

	resource "aws_instance" "K8S_Master_Node" {
	  ami           = "ami-04bde106886a53080"
	  instance_type = "t2.medium"
	  subnet_id = "${aws_subnet.subnet-1a.id}"
	  vpc_security_group_ids = ["${aws_security_group.SG.id}"]
	  key_name = "key"
	 tags ={
	    Environment = "${var.environment_tag}"
	    Name= "K8S_Master_Node"
	  }
	

	}
	resource "aws_instance" "K8S_Slave1_Node" {
	  ami           = "ami-04bde106886a53080"
	  instance_type = "t2.medium"
	  subnet_id = "${aws_subnet.subnet-1a.id}"
	  vpc_security_group_ids = ["${aws_security_group.SG.id}"]
	  key_name = "key"
	 tags ={
	    Environment = "${var.environment_tag}"
	    Name= "K8S_Slave1_Node"
	  }
	

	}
	resource "aws_instance" "K8S_Slave2_Node" {
	  ami           = "ami-04bde106886a53080"
	  instance_type = "t2.medium"
	  subnet_id = "${aws_subnet.subnet-1a.id}"
	  vpc_security_group_ids = ["${aws_security_group.SG.id}"]
	  key_name = "key"
	 tags ={
	    Environment = "${var.environment_tag}"
	    Name= "K8S_Slave2_Node"
	  }
	

	}
	resource "aws_instance" "JenkinsNode" {
	  ami           = "ami-0a9d27a9f4f5c0efc"
	  instance_type = "t2.micro"
	  subnet_id = "${aws_subnet.subnet-1a.id}"
	  vpc_security_group_ids = ["${aws_security_group.SG.id}"]
	  key_name = "key"
	 tags ={
	    Environment = "${var.environment_tag}"
	    Name= "JenkinsNode"
	  }
	

	}
	

	/*
	resource "aws_instance" "DockerNode" {
	  ami           = "ami-0a9d27a9f4f5c0efc"
	  instance_type = "t2.micro"
	  subnet_id = "${aws_subnet.subnet-1a.id}"
	  vpc_security_group_ids = ["${aws_security_group.SG.id}"]
	  key_name = "key"
	 tags ={
	    Environment = "${var.environment_tag}"
	    Name= "DockerNode"
	  }
	
	}
	
	*/
