
provider "aws"{
	region = "${var.aws_region}"
	access_key = "AKIAIR6LKYVGOPJBY62Q"
	secret_key = "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"
}

#Creating a new key pair while launching the instance
#1. Generate Public and Private Key using ssh-keygen and save into a file

resource "aws_key_pair" "zox_ssh" {
	key_name = "zox_ssh"
	public_key = "${file("zox-key")}"
}

#Amazon EC2 instance Launch

resource "aws_instance" "zox_instance" {
	count = "${var.instance_count}"
	ami = "ami-38708b45"
	instance_type = "t2.micro"
	key_name = "${aws_key_pair.zox_ssh.key_name}"
	subnet_id = "${aws_subnet.subnet.id}"
	associate_public_ip_address = true
tags {
	Name = "Zox_Instance-$(count.index + 1)"
}
}
resource "aws_vpc" "zox" {
	cidr_block = "${var.vpc_cidr}"
	instance_tenancy = "default"
tags {
	Name = "zox"
	Location = "Delhi"
}
}

resource "aws_subnet" "subnet" {
	cidr_block = "${var.subnet}"
	vpc_id = "${aws_vpc.zox.id}"
tags {
	Name = "Zox Subnet"
}
}

