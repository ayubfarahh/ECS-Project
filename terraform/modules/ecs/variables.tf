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