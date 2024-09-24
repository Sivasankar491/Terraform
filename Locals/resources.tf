resource "aws_instance" "expense" {
  for_each               = var.expense_instances
  ami                    = data.aws_ami.expense_instances_ami.id
  vpc_security_group_ids = []
  instance_type          = each.value
  tags = merge(
    var.common_tags,
    {
      Name = each.key
    }
  )
}

resource "aws_security_group" "expense_sg" {
  name        = "Allow-SSH"
  description = "Allowing port 22"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.ip_range #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    var.common_tags,
    {
      Name = "allow-ssh"
    }
  )
}