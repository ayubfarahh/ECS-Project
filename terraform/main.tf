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
    cross_zone_lb = var.cross_zone_lb
    bucket_name = var.bucket_name
    
    
}

module "iam" {
    source = "./modules/iam"
    iam_role_name = var.iam_role_name
    policy_arn = var.policy_arn
    policy_version = var.policy_version
    policy_effect = var.policy_effect
    policy_service = var.policy_service
    policy_action = var.policy_action
    policy_sid = var.policy_sid
    policy_service_s3 = var.policy_service_s3
    policy_action_s3 = var.policy_action_s3
  
}

module "ecs" {
    source = "./modules/ecs"
    
    ecs_task_execution_role_arn = module.iam.ecs_task_execution_role_arn
    public_subnet = module.vpc.public_subnet
    vpc_id = module.vpc.vpc_id
    alb_sg = module.alb.alb_sg
    alb_target = module.alb.alb_target
    alb_listener = module.alb.alb_listener

    ecs_cluster_name = var.ecs_cluster_name
    task_definition_family = var.task_definition_family
    task_definition_network_mode = var.task_definition_network_mode
    task_definition_requires_compatibilities = var.task_definition_requires_compatibilities
    task_definition_cpu = var.task_definition_cpu
    task_definition_memory = var.task_definition_memory
    container_definitions_name = var.container_definitions_name
    container_definitions_image = var.container_definitions_image
    container_definitions_port = var.ecs_service_lb_container_port
    tcp_protocol_ecs = var.tcp_protocol_ecs
    ecs_sg_name = var.ecs_sg_name
    ecs_sg_ingress_port = var.ecs_sg_ingress_port
    ecs_sg_egress_port = var.ecs_sg_egress_port
    ecs_sg_egress_protocol = var.ecs_sg_egress_protocol
    ecs_sg_egress_cidr = var.ecs_sg_egress_cidr
    ecs_service_name = var.ecs_service_name
    ecs_service_launch_type = var.ecs_service_launch_type
    ecs_service_desired_count = var.ecs_service_desired_count
    ecs_service_assign_public_ip = var.ecs_service_assign_public_ip
    ecs_service_lb_container_name = var.ecs_service_lb_container_name
    ecs_service_lb_container_port = var.ecs_service_lb_container_port
    container_definitions_essential = var.container_definitions_essential
    container_insights = var.container_insights
    insights_value = var.insights_value
    
  
}

module "route53" {
    source = "./modules/route53"
    alb_dns_name = module.alb.alb_dns_name
    alb_zone_id = module.alb.alb_zone_id
    route53_zone_name = var.route53_zone_name
    route53_record_root_name = var.route53_record_root_name
    route53_record_type = var.route53_record_type
    route53_record_evaluate_target_health = var.route53_record_evaluate_target_health
    route53_record_www_name = var.route53_record_www_name
    route53_alias_name = var.route53_alias_name
    route53_alias_zone_id = var.route53_alias_zone_id
  
}

module "acm" {
    source = "./modules/acm"
    zone_id = module.route53.zone_id
    domain_name = var.domain_name
    validation_method = var.validation_method
    ttl = var.ttl
  
}