data "aws_ssm_parameter" "db_password" {
  name            = "db_password"
  with_decryption = true  # Decrypt the secure string
}

data "aws_ssm_parameter" "db_name" {
  name = "db_name"
}


resource "aws_db_instance" "db" {
  allocated_storage = var.allocated_storage
  engine = var.engine
  engine_version = var.engine_version
  username = var.username
  password = data.aws_ssm_parameter.db_password.value
  db_name = data.aws_ssm_parameter.db_name.value
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids
  publicly_accessible = false
  instance_class = var.instance_class
  skip_final_snapshot = true
}

