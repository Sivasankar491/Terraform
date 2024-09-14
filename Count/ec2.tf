resource "aws_instance" "expense" {
    ami = var.ami_id
    count = length(var.instance_names)
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = {
        Name = var.instance_names[count.index]
    }
}

resource "aws_security_group" "allow_ssh" {
    description = "Allows on port 22 from everyehere"
    name = "Allow-ssh"

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

    tags = {
        Name = "allow_ssh"
    }
  
}