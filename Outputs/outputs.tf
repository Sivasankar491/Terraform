output "private_ip_info" {
    value = aws_instance.terraform[*].private_ip
}

output "public_ip_info" {
    value = aws_instance.terraform[*].public_ip
}