resource "aws_route53_record" "expense_r53" {
  zone_id  = data.aws_route53_zone.expense_zone.id
  for_each = aws_instance.expense
  name     = each.key == "Frontend" ? data.aws_route53_zone.expense_zone.name : "${each.key}.${data.aws_route53_zone.expense_zone.name}"
  type     = "A"
  ttl      = 1
  records  = each.key == "Frontend" ? [each.value.public_ip] : [each.value.private_ip]
}