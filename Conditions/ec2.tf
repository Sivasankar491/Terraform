resource "aws_instance" "terraform" {
    ami = var.ami_id
    instance_type = var.instance_names[count.index] == "MySQL" ? "t2.medium" : "t2.micro"
    count = length(var.instance_names)
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = {
      Name = var.instance_names[count.index]
    }
}


resource "aws_security_group" "allow_ssh" {
    name = "Allow_SSH"
    description = "It allows on port 22 from everywhere"

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
        protocol         = var.ingress_protocol
        cidr_blocks      = var.ip_range
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
      Name = "Allow-SSH"
    }
}