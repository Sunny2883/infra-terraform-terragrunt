terraform {
  source = "../../../modules/vpc" # Path to your VPC module
}

inputs = {
  region                    = "ap-south-1"
  cidr_block                = "10.0.0.0/16"          # Change as needed
  cidr_block_subnet         = "10.0.0.0/24"          # Change as needed
  availability_zone_subnet  = "ap-south-1a"          # Change as needed
  route_table_name="QA_route_table"
  vpc_name="QA_vpc"
  aws_internet_gateway_name="QA-ig"
  subnet_name="QA_subnet"
}