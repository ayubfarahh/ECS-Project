variable "alb_name" {
    type = string
  
}


variable "load_balancer_type" {
    type = string
}

variable "alb_sg_name" {
    type = string
}

variable "http_port" {
    type = number
}

variable "tcp_protocol" {
    type = string
  
}

variable "allow_cidr" {
    type = list(string)
  
}

variable "https_port" {
    type = number
  
}

variable "any_port" {
    type = number
  
}

variable "any_protocol" {
    type = number
}

variable "alb_target_name" {
    type = string
  
}

variable "http_protocol" {
    type = string
  
}

variable "alb_target_type" {
    type = string
  
}


variable "health_check_path" {
    type = string
  
}

variable "health_check_matcher" {
    type = string
  
}

variable "health_check_interval" {
    type = number
  
}

variable "health_check_timeout" {
    type = number
  
}

variable "healthy_threshold" {
    type = number
  
}

variable "unhealthy_threshold" {
    type = number
  
}

variable "ssl_policy" {
    type = string
  
}

variable "certificate_arn" {
    type = string
  
}

variable "lb_listener_default_type" {
    type = string
  
}


variable "https_protocol" {
    type = string
  
}

variable "iam_role_name" {
    type = string
  
}

variable "policy_arn" {
    type = string
  
}

variable "vpc_cidr" {
    type = string
  
}

variable "public_subnet_cidr" {
    type = string
  
}

variable "public_subnet_az" {
    type = string
  
}

variable "map_public_ip_on_launch" {
    type = bool
  
}

variable "public_subnet_backup_cidr" {
    type = string
  
}

variable "public_subnet_backup_az" {
    type = string
  
}

variable "public_route_table_cidr" {
    type = string
  
}

variable "public_route_table_tag" {
    type = string
  
}


variable "route53_zone_name" {
    type = string
  
}

variable "route53_record_root_name" {
    type = string
  
}

variable "route53_record_type" {
    type = string
  
}

variable "route53_record_evaluate_target_health" {
    type = bool
  
}

variable "route53_record_www_name" {
    type = string
  
}

variable "route53_alias_name" {
    type = string
  
}

variable "route53_alias_zone_id" {
    type = string
  
}


variable "ecs_cluster_name" {
    type = string
  
}

variable "task_definition_family" {
  type = string
}

variable "task_definition_network_mode" {
    type = string
  
}

variable "task_definition_requires_compatibilities" {
    type = list(string)
  
}

variable "task_definition_cpu" {
    type = string
  
}

variable "task_definition_memory" {
    type = string
  
}

variable "container_definitions_name" {
  type = string
}

variable "container_definitions_image" {
    type = string
  
}

variable "container_definitions_port" {
    type = number
  
}

variable "tcp_protocol_ecs" {
    type = string
}

variable "ecs_sg_name" {
    type = string
  
}

variable "ecs_sg_ingress_port" {
    type = number

  
}

variable "ecs_sg_egress_port" {
    type = number
  
}

variable "ecs_sg_egress_protocol" {
    type = string
  
}

variable "ecs_sg_egress_cidr" {
    type = list(string)
  
}

variable "ecs_service_name" {
    type = string
  
}

variable "ecs_service_launch_type" {
    type = string
  
}

variable "ecs_service_desired_count" {
    type = number
  
}

variable "ecs_service_assign_public_ip" {
    type = bool
  
}

variable "ecs_service_lb_container_name" {
    type = string
  
}

variable "ecs_service_lb_container_port" {
    type = number
  
}

variable "container_definitions_essential" {
    type = bool
  
}

variable "policy_version" {
    type = string
  
}

variable "policy_effect" {
    type = string
  
}

variable "policy_service" {
  type = string
}

variable "policy_action" {
    type = string
  
}

variable "cross_zone_lb" {
    type = bool
  
}

variable "bucket_name" {
    type = string
  
}


variable "policy_sid" {
    type = string
  
}

variable "policy_service_s3" {
    type = string
}

variable "policy_action_s3" {
    type = string
  
}

variable "container_insights" {
    type = string
  
}

variable "insights_value" {
    type = string
  
}

variable "zone_id" {
    type = string
  
}