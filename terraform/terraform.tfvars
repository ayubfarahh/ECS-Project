// ALB

alb_name = "alb"
load_balancer_type = "application"
alb_sg_name = "alb sg"
http_port = 80
tcp_protocol = "tcp"
allow_cidr = ["0.0.0.0/0"]
https_port = 443
any_port = 0
any_protocol = -1

alb_target_name = "alb-target"
http_protocol = "HTTP"
alb_target_type = "ip"
health_check_path = "/"
health_check_matcher = "200"
health_check_interval = 20
health_check_timeout = 5
healthy_threshold = 2
unhealthy_threshold = 2
ssl_policy = "ELBSecurityPolicy-2016-08"
certificate_arn = "arn:aws:acm:eu-west-2:940622738555:certificate/eb546895-f952-47a6-bc30-f45f65c3d6a8"
lb_listener_default_type = "forward"
https_protocol = "HTTPS"
cross_zone_lb = true
bucket_name = "alb-access-logs-ayub"


// IAM
iam_role_name = "TaskExecutionRole"
policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
policy_version = "2012-10-17"
policy_effect = "Allow"
policy_service = "ecs-tasks.amazonaws.com"
policy_action = "sts:AssumeRole"
policy_sid = "AllowELBLogging"
policy_service_s3 = "elasticloadbalancing.amazonaws.com"
policy_action_s3 = "s3:PutObject"

// VPC
vpc_cidr = "10.0.0.0/24"
public_subnet_cidr = "10.0.0.0/25"
public_subnet_az = "eu-west-2a"
map_public_ip_on_launch = true
public_subnet_backup_cidr = "10.0.0.128/26"
public_subnet_backup_az = "eu-west-2b"
public_route_table_cidr = "0.0.0.0/0"
public_route_table_tag = "Public Route Table"


// ROUTE53
route53_zone_name = "ayubs.live"
route53_record_root_name = "ayubs.live"
route53_record_type = "A"
route53_record_evaluate_target_health = true
route53_record_www_name = "www.ayubs.live"
route53_alias_name = "alb-1265994366.eu-west-2.elb.amazonaws.com"
route53_alias_zone_id = "ZHURV8PSTC4K8"

// ECS
ecs_cluster_name = "ecs_cluster"
container_insights = "containerInsights"
insights_value = "enabled"
task_definition_family = "service"
task_definition_network_mode = "awsvpc"
task_definition_requires_compatibilities = ["FARGATE"]
task_definition_cpu = "256"
task_definition_memory = "512"

container_definitions_name = "frontend"
container_definitions_image = "940622738555.dkr.ecr.eu-west-2.amazonaws.com/frontend:latest"
container_definitions_essential = true
container_definitions_port = 3000
tcp_protocol_ecs = "tcp"

ecs_sg_name = "ecs_sg"
ecs_sg_ingress_port = 3000
ecs_sg_egress_port = 0
ecs_sg_egress_protocol = "-1"
ecs_sg_egress_cidr = ["0.0.0.0/0"]

ecs_service_name = "frontend-service"
ecs_service_launch_type = "FARGATE"
ecs_service_desired_count = 1
ecs_service_assign_public_ip = true
ecs_service_lb_container_name = "frontend"
ecs_service_lb_container_port = 3000




