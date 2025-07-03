resource "aws_ecs_cluster" "ecs_cluster" {
    name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "ecs_task" {
    family = var.task_definition_family
    network_mode = var.task_definition_network_mode
    requires_compatibilities = var.task_definition_requires_compatibilities
    cpu = var.task_definition_cpu
    memory = var.task_definition_memory
    execution_role_arn = var.ecs_task_execution_role_arn

    container_definitions = jsonencode([
        {
            name = var.container_definitions_name
            image = var.container_definitions_image
            essential = var.container_definitions_essential
            portMappings = [
                {
                    containerPort = var.container_definitions_port
                    hostPort = var.container_definitions_port
                    protocol = var.tcp_protocol_ecs
                }
            ]

        }
    ])
  
}

resource "aws_security_group" "ecs_sg" {
    name = var.ecs_sg_name
    vpc_id = var.vpc_id

    ingress{
        from_port = var.ecs_sg_ingress_port
        to_port = var.ecs_sg_ingress_port
        protocol = var.tcp_protocol_ecs
        security_groups = [var.alb_sg]
    }

    egress{
        from_port = var.ecs_sg_egress_port
        to_port = var.ecs_sg_egress_port
        protocol = var.ecs_sg_egress_protocol
        cidr_blocks = var.ecs_sg_egress_cidr
    }
  
}

resource "aws_ecs_service" "ecs_service" {
    name = var.ecs_service_name
    cluster = aws_ecs_cluster.ecs_cluster.id
    task_definition = aws_ecs_task_definition.ecs_task.id
    launch_type = var.ecs_service_launch_type
    desired_count = var.ecs_service_desired_count

    network_configuration {
      subnets = var.public_subnet
      security_groups = [aws_security_group.ecs_sg.id]
      assign_public_ip = var.ecs_service_assign_public_ip
    }

    load_balancer {
      target_group_arn = var.alb_target
      container_name = var.ecs_service_lb_container_name
      container_port = var.ecs_service_lb_container_port
    }

    depends_on = [var.alb_listener]
  
}