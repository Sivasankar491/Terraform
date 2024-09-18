resource "aws_route53_record" "expense" {
  count = length(var.expense_instances)
  zone_id = data.aws_route53_zone.expense_zone.id

  #backend.daws81s.online
  name    = "${var.expense_instances[count.index]}.${data.aws_route53_zone.expense_zone.name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.expense[count.index].private_ip]
  allow_overwrite = true
}