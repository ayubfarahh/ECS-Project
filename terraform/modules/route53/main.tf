resource "aws_route53_zone" "ayub" {
  name = "ayubs.live"
}

resource "aws_route53_record" "www" {
    zone_id = aws_route53_zone.ayub.zone_id
    name = "ayubs.live"
    type = "A"

    alias {
      name = var.alb_dns_name
      zone_id = var.alb_zone_id
      evaluate_target_health = true
    }

  
}