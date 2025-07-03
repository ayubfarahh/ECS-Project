module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    public_subnet_cidr = var.public_subnet_cidr
    public_subnet_az = var.public_subnet_az
    map_public_ip_on_launch = var.map_public_ip_on_launch
    public_subnet_backup_cidr = var.public_subnet_backup_cidr
    public_subnet_backup_az = var.public_subnet_backup_az
    public_route_table_cidr = var.public_route_table_cidr
    public_route_table_tag = var.public_route_table_tag
}

module "alb" {
    source = "./modules/alb"
    vpc_id = module.vpc.vpc_id
    public_subnet = module.vpc.public_subnet
    alb_name = var.alb_name
    load_balancer_type = var.load_balancer_type
    alb_sg_name = var.alb_sg_name
    http_port = var.http_port
    tcp_protocol = var.tcp_protocol
    allow_cidr = var.allow_cidr
    http_protocol = var.http_protocol
    https_port = var.https_port
    any_port = var.any_port
    any_protocol = var.any_protocol
    alb_target_name = var.alb_target_name
    alb_target_type = var.alb_target_type
    health_check_path = var.health_check_path
    health_check_matcher = var.health_check_matcher
    health_check_interval = var.health_check_interval
    health_check_timeout = var.health_check_timeout
    healthy_threshold = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    ssl_policy = var.ssl_policy
    certificate_arn = var.certificate_arn
    lb_listener_default_type = var.lb_listener_default_type
    https_protocol = var.https_protocol
    
}

module "iam" {
    source = "./modules/iam"
    iam_role_name = var.iam_role_name
    policy_arn = var.policy_arn
  
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