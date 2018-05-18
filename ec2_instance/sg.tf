# Defining security groups for subnet

resource "aws_security_group" "zox-sg" {
	name = "zox-vpc-web"
	description = "Allow incoming HTTP, HTTPS request and SSH"

ingress {
	from_port = 80
	to_port = 80
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
}

ingress {
	from_port = 443
	to_port = 443
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
}

ingress {
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["192.168.0.0/16"]
}
}
