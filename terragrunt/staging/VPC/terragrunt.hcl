terraform {
  source = "../../../modules/vpc"
}


locals {
  environment              = "Staging"                         
  region                   = "ap-south-1"                  
  cidr_block               = "10.0.0.0/16"                
  availability_zone        = "${local.region}a"            
  subnet_cidr_block        = "10.0.0.0/24"                 
  name_prefix              = "${local.environment}_vpc"   
} 


inputs = {
  region                    = local.region
  cidr_block                = local.cidr_block
  cidr_block_subnet         = local.subnet_cidr_block
  availability_zone_subnet  = local.availability_zone
  
 
  route_table_name          = "${local.environment}_route_table"
  vpc_name                  = "${local.name_prefix}"
  aws_internet_gateway_name = "${local.environment}_ig"
  subnet_name               = "${local.environment}_subnet"
}
