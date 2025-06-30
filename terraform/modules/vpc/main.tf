resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/24"
  
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
  
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.0.0/25"
    availability_zone = "eu-west-2a"
    map_public_ip_on_launch = true

}

resource "aws_subnet" "public_subnet_backup" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.0.128/26"
  availability_zone = "eu-west-2b"
  map_public_ip_on_launch = true
}

resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "Public Route Table"
    }
}

resource "aws_route_table_association" "rta1" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_route_table.id   
}

resource "aws_route_table_association" "rta2" {
    subnet_id = aws_subnet.public_subnet_backup.id
    route_table_id = aws_route_table.public_route_table.id
}

