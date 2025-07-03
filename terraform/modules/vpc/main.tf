resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
  
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
  
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public_subnet_cidr
    availability_zone = var.public_subnet_az
    map_public_ip_on_launch = var.map_public_ip_on_launch

}

resource "aws_subnet" "public_subnet_backup" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet_backup_cidr
  availability_zone = var.public_subnet_backup_az
  map_public_ip_on_launch = var.map_public_ip_on_launch
}

resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = var.public_route_table_cidr
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = var.public_route_table_tag
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

