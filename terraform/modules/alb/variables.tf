variable "vpc_id" {
    type = string
  
}

variable "public_subnet" {
    type = list(string)
  
}

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

variable "cross_zone_lb" {
    type = bool
  
}

variable "bucket_name" {
    type = string
  
}