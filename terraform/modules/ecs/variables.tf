variable "ecs_task_execution_role_arn" {
    type = string
  
}

variable "public_subnet" {
    type = list(string)
  
}

variable "vpc_id" {
    type = string
  
}

variable "alb_sg" {
    type = string
  
}

variable "alb_target" {
    type = string
  
}

variable "alb_listener" {
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