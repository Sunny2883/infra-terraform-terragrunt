terraform {
  source = "../../../modules/SG"
}

locals {
  environment    = "QA"                    
  cidr_block     = ["0.0.0.0/0"]           
}

inputs = {
  vpc_id     = dependency.VPC.outputs.vpc_id        
  cidr_block = local.cidr_block                      

  # Naming convention for the security group
  name = "${local.environment}_sg" 
}

dependency "VPC" {
  config_path = "../VPC"                            
   # Avoids issues during destroy

}
