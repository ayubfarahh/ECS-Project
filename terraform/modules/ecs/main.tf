resource "aws_ecs_cluster" "ecs_cluster" {
    name = "ecs_cluster"
}

resource "aws_ecs_task_definition" "ecs_task" {
    family = "service"
    network_mode = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu = "256"
    memory = "512"
    execution_role_arn = var.ecs_task_execution_role_arn

    container_definitions = jsonencode([
        {
            name = "frontend"
            image = "940622738555.dkr.ecr.eu-west-2.amazonaws.com/frontend:latest"
            essential = true 
            portMappings = [
                {
                    containerPort = 3000
                    hostPort = 3000
                    protocol = "tcp"
                }
            ]

        }
    ])
  
}

resource "aws_security_group" "ecs_sg" {
    name = "ecs_sg"
    description = "SG for ECS"
    vpc_id = var.vpc_id

    ingress{
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        security_groups = [var.alb_sg]
    }

    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

resource "aws_ecs_service" "ecs_service" {
    name = "frontend-service"
    cluster = aws_ecs_cluster.ecs_cluster.id
    task_definition = aws_ecs_task_definition.ecs_task.id
    launch_type = "FARGATE"
    desired_count = 1

    network_configuration {
      subnets = var.public_subnet
      security_groups = [aws_security_group.ecs_sg.id]
      assign_public_ip = true
    }

    load_balancer {
      target_group_arn = var.alb_target
      container_name = "frontend"
      container_port = 3000
    }

    depends_on = [var.alb_listener]
  
}