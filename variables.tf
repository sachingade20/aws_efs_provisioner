variable "efs_name" {
	type = "string"
	description = "Name of EFS"
	default = "aws-efs"
}


variable "vpc_id" {
	type = "string"
	description = "VPC Id for to create"
	default = "aws-efs"
}
