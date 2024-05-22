
variable instance_type {
    default = "t3.medium"
}
variable ami_id {
    default = "ami-01c14e50374bf9b34"
}
variable volume_size {
    default = "50"
}
variable volume_type {
    default = "gp3"
}

variable vpc_id {
    type = string 
}

variable aws_subnet_main_a {}
variable ecs_instance_profile {}
variable ecs_cluster_name {}