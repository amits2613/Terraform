#Defining route table 

resource "aws_route_table" "zox_public_rt" {
	vpc_id = "${aws_vpc.zox.id}"

 route {
	cidr_block = "0.0.0.0/0"
	gateway_id = "${aws_internet_gateway.zox_gw.id}"
 
}

 tags {
	Name = "Zox Public Subnet RT"
}
}

#Associate route table to public subnet

resource "aws_route_table_association" "zox_public" {
	subnet_id = "${aws_subnet.subnet.id}"
	route_table_id = "${aws_route_table.zox_public_rt.id}"
}


