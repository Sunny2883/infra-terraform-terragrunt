terraform {
  source = "../../../modules/vpc" 
}

inputs = {
  region                    = "ap-south-1"
  cidr_block                = "10.0.0.0/16"          
  cidr_block_subnet         = "10.0.0.0/24"         
  availability_zone_subnet  = "ap-south-1a"        
  route_table_name="staging_route_table"
  vpc_name="staging_vpc"
  aws_internet_gateway_name="staging-ig"
  subnet_name="staging_subnet"
}