remote_state {
    backend = "s3"
    generate = {
        path = "state.tf"
        if_exists = "overwrite_terragrunt"
    }
    config = {
        profile     = "terraform-sunny"
        role_arn    = "arn:aws:iam::396608771618:role/terraform-role"
        bucket      = "terraformsunny"
        key         = "${path_relative_to_include()}/terraform.tfstate"
        region      = "ap-south-1"
        encrypt     = true
    }
}

generate "provider" {
    path = "provider.tf"
    if_exists = "overwrite_terragrunt"

    contents = <<EOF
    provider "aws" {
        region = "ap-south-1"
        profile = "terraform-sunny"

        assume_role {
            role_arn = "arn:aws:iam::396608771618:role/terraform-role"
        }
    }
EOF
}
