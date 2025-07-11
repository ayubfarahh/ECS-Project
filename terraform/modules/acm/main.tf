resource "aws_acm_certificate" "certifcate" {
    domain_name = var.domain_name
    validation_method = var.validation_method

    lifecycle {
      create_before_destroy = true
    }
  
}

resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.certifcate.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = var.ttl
  type            = each.value.type
  zone_id         = var.zone_id
}

resource "aws_acm_certificate_validation" "example" {
  certificate_arn         = aws_acm_certificate.certifcate.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}