module "vpc" {
  source = "./modules/vpc"
}

module "iam" {
  source = "./modules/iam"
}


module "instance" {
  source               = "./modules/instance"
  vpc_id               = module.vpc.vpc_number
  aws_subnet_main_a    = module.vpc.aws_subnet_main_a
  ecs_instance_profile = module.iam.aws_instance_profile
  ecs_cluster_name     = module.ecs.cluster_name
}

module "ecs" {
  source = "./modules/ecs"
}

module "taskdefination" {
  source = "./modules/taskdefination"
}

module "service" {
  source = "./modules/service"
}
