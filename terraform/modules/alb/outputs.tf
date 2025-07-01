output "alb_sg" {
    value = aws_security_group.alb_sg.id
  
}

output "alb_target" {
    value = aws_lb_target_group.alb_target.arn
  
}

output "alb_listener" {
    value = aws_lb_listener.https
  
}