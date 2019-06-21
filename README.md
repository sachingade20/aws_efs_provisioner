# AWS EFS Terraform module

Terraform module which creates EFS on AWS.

These types of resources are supported:

* [Elastic File System (EFS)](https://www.terraform.io/docs/providers/aws/r/efs_file_system.html)

### Prerequisite

    ### Install Terraform

        Download and install Terraform - you can follow the guide from https://learn.hashicorp.com/terraform/getting-started/install.html

    
    ### AWS Credentials

        Export the AWS credentials which will be used to authenticate with Amazon AWS:
        
            export AWS_ACCESS_KEY_ID="XXX"
            export AWS_SECRET_ACCESS_KEY="XXX"



## Usage

Accepts VPC ID and EFS Name as Input . Creates EFS and creates sec group and mount targets on all subnets in VPC 
    
    $> terraform init
    $> terraform apply -var "efs_name=demo-efs" -var "vpc_id=vpc-XXXXX" -auto-approve=true
    
 