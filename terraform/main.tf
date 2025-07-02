module "vpc" {
    source = "./modules/vpc"
}

module "alb" {
    source = "./modules/alb"
    vpc_id = module.vpc.vpc_id
    public_subnet = module.vpc.public_subnet
    
}

module "iam" {
    source = "./modules/iam"
  
}

module "ecs" {
    source = "./modules/ecs"
    
    ecs_task_execution_role_arn = module.iam.ecs_task_execution_role_arn
    public_subnet = module.vpc.public_subnet
    vpc_id = module.vpc.vpc_id
    alb_sg = module.alb.alb_sg
    alb_target = module.alb.alb_target
    alb_listener = module.alb.alb_listener
    
  
}

module "route53" {
    source = "./modules/route53"
    alb_dns_name = module.alb.alb_dns_name
    alb_zone_id = module.alb.alb_zone_id
  
}