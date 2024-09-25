resource "aws_security_group" "dynamic_sg" {
  name        = "Dynamic-sg"
  description = "allows the ports which are mentioned in variables"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  tags = {
    Name = "SG-DYNAMIC"
  }
}

resource "aws_instance" "provison_ec2" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.dynamic_sg.id]
    tags = {
        Name = "terraform"
    }
    
    provisioner "local-exec" {
       #command = "echo ${aws_instance.provison_ec2.private_ip} > private.txt"
       command = "echo ${self.public_ip} > public.txt"
    }
}