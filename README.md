# aws_efs_provisioner

# AWS EC2 Instance Terraform module

Terraform module which creates EFS on AWS.

These types of resources are supported:

* [Elastic File System (EFS)](https://www.terraform.io/docs/providers/aws/r/efs_file_system.html)


## Usage
Accepts VPC ID and EFS Name as Input . Creates EFS and creates sec group and mount targets on all subnets in VPC 
    terraform init
    terraform apply -var "efs_name=demo-efs" -var "vpc_id=vpc-XXXXX" -auto-approve=true
    
 