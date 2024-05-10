resource "aws_route53_record" "expense" {
  for_each = aws_instance.expense #Looping from the Map
  zone_id = var.zone_id
  name    = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}" #False: backend.dawsmani.site
  type    = "A"
  ttl     = 1
  records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
  # if records already exists
  allow_overwrite = true
}