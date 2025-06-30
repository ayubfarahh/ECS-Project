resource "aws_ecs_cluster" "ecs_cluster" {
    name = "ecs_cluster"
}

resource "aws_ecs_task_definition" "ecs_task" {
    family = "service"
    network_mode = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu = "256"
    memory = "512"
    execution_role_arn = 
  
}