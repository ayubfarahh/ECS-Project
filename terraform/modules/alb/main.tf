resource "aws_lb" "alb" {
    name = var.alb_name
    load_balancer_type = var.load_balancer_type
    security_groups = [aws_security_group.alb_sg.id]
    subnets = var.public_subnet
    enable_cross_zone_load_balancing = var.cross_zone_lb
    enable_deletion_protection = var.cross_zone_lb
    drop_invalid_header_fields = var.cross_zone_lb
    
}


resource "aws_security_group" "alb_sg" {
    name = var.alb_sg_name
    description = "ALB SG Allow incoming HTTPS/HTTP traffic"
    vpc_id = var.vpc_id
  
  ingress{
    from_port = var.http_port
    to_port = var.http_port
    protocol = var.tcp_protocol
    cidr_blocks = var.allow_cidr
  }

  ingress{
    from_port = var.https_port
    to_port = var.https_port
    protocol = var.tcp_protocol
    cidr_blocks = var.allow_cidr
  }
  
  egress {
    from_port = var.any_port
    to_port = var.any_port
    protocol = var.any_protocol
    cidr_blocks = var.allow_cidr
  }
}

resource "aws_lb_target_group" "alb_target" {
    name = var.alb_target_name
    port = var.http_port
    protocol = var.http_protocol
    vpc_id = var.vpc_id
    target_type = var.alb_target_type

    health_check {
      path = var.health_check_path
      protocol = var.http_protocol
      matcher = var.health_check_matcher
      interval = var.health_check_interval
      timeout = var.health_check_timeout
      healthy_threshold = var.healthy_threshold
      unhealthy_threshold = var.unhealthy_threshold
    }
}

resource "aws_lb_listener" "https" {
    load_balancer_arn = aws_lb.alb.arn
    port = var.https_port
    protocol = var.https_protocol
    ssl_policy = var.ssl_policy
    certificate_arn = var.certificate_arn
    

    default_action {
      type = var.lb_listener_default_type
      target_group_arn = aws_lb_target_group.alb_target.arn
    }
}

