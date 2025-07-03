resource "aws_route53_zone" "ayub" {
  name = var.route53_zone_name
}

resource "aws_route53_record" "root" {
    zone_id = aws_route53_zone.ayub.zone_id
    name = var.route53_record_root_name
    type = var.route53_record_type

    alias {
      name = var.alb_dns_name
      zone_id = var.alb_zone_id
      evaluate_target_health = var.route53_record_evaluate_target_health
    }  
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.ayub.zone_id
  name    = var.route53_record_www_name
  type    = var.route53_record_type

  alias {
    name                   = var.route53_alias_name
    zone_id                = var.route53_alias_zone_id
    evaluate_target_health = var.route53_record_evaluate_target_health
  }
}