resource "aws_iam_role" "ecs_task_execution_role" {
    name = var.iam_role_name

    assume_role_policy = jsonencode({
        Version = var.policy_version,
        Statement = [
            {
                Effect = var.policy_effect
                Principal = {
                    Service = var.policy_service
                },
                Action = var.policy_action
            }
        ]
    })
}

resource "aws_iam_role_policy_attachment" "ecs_execution_policy" {
    role = aws_iam_role.ecs_task_execution_role.name
    policy_arn = var.policy_arn
  
}