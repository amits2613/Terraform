#Defining internet gateway for public subnet

resource "aws_internet_gateway" "zox_gw" {
	vpc_id = "${aws_vpc.zox.id}"


tags {
	Name = "Zox VPC IGW"
}
}
