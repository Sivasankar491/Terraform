output "ami_details" {
    value = data.aws_ami.expense_instances_ami.id
}

output "r53zone_id" {
    value = data.aws_route53_zone.expense_zone.id
}

output "r53zone_name" {
    value = data.aws_route53_zone.expense_zone.name
}

output "list_privateips" {
    value = aws_instance.expense[*].private_ip
}

