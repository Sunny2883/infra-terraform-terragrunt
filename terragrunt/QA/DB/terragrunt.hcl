terraform {
  source = "../../../modules/DB"
}

locals {
  environment    = "QA"                   
}

inputs = {
  instance_class        = "db.t3.micro"
  vpc_security_group_ids = [dependency.SG.outputs.sg_id]
  db_subnet_group_name   = dependency.VPC.outputs.db_subnet_group_name
  username               = "postgres"
  engine_version         = "12.16"
  engine                 = "postgres"
  allocated_storage      = 20
}

dependency "VPC" {
  config_path = "../VPC"
   # Ensures no issues during destroy
    
}

dependency "SG" {
  config_path = "../SG"
    # Ensures no issues during destroy
    
}
