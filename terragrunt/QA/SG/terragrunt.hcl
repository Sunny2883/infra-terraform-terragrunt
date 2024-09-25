terraform{
    source="../../../modules/SG"
}

inputs= {
    vpc_id=dependency.VPC.outputs.vpc_security_group_ids
    cidr_block=["0.0.0.0/0"]
}

dependency "VPC"{
    config_path="../VPC"
}