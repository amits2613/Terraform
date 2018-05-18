variable "aws_region" {
	description = "region for the VPC"
	default = "us-east-1"
}

variable "instance_count" {
        default = "5"
}

variable "vpc_cidr" {
	description = "CIDR for the vpc"
	default = "192.168.0.0/16"
}

variable "subnet" {
	default = "192.168.1.0/24"
}
