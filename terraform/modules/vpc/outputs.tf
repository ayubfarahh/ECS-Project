output "vpc_id" {
    value = aws_vpc.vpc.id
  
}

output "public_subnet" {
  value = [
    aws_subnet.public_subnet.id,
    aws_subnet.public_subnet_backup.id
  ]
}