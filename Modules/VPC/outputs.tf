output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.db_subnet_group_name.name
}