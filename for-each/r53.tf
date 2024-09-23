resource "aws_route53_record" "expense" {
  zone_id =  data.aws_route53_zone.expense_zone.id
  for_each = aws_instance.expense
  name    =  each.key == "Frontend" ? data.aws_route53_zone.expense_zone.name : "${each.key}.${data.aws_route53_zone.expense_zone.name}"
  type    = "A"
  ttl     = 1
  records =  each.key == "Frontend" ? [each.value.public_ip] : [each.value.private_ip]
}



# resource "aws_route53_record" "expense" {
#   for_each = aws_instance.expense
#   zone_id = var.zone_id
#   #backend.daws81s.online
#   name            = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
#   type            = "A"
#   ttl             = 1
#   records         = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
#   allow_overwrite = true
# }