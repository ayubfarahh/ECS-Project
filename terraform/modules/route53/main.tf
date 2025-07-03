resource "aws_route53_zone" "ayub" {
  name = "ayubs.live"
}

resource "aws_route53_record" "root" {
    zone_id = aws_route53_zone.ayub.zone_id
    name = "ayubs.live"
    type = "A"

    alias {
      name = var.alb_dns_name
      zone_id = var.alb_zone_id
      evaluate_target_health = true
    }  
}

# resource "aws_route53_record" "www" {
#   zone_id = aws_route53_zone.ayub.zone_id
#   name    = "www.ayubs.live"
#   type    = "A"

#   alias {
#     name                   = "alb-1265994366.eu-west-2.elb.amazonaws.com"
#     zone_id                = "ZHURV8PSTC4K8"
#     evaluate_target_health = true
#   }
# }