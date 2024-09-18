resource "aws_instance" "expense" {
    ami = data.aws_ami.expense_instances_ami.id
    count = length(var.expense_instances)
    instance_type = var.expense_instances[count.index] == "MySQL" ? "t2.small" : "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow-ssh.id]

    tags = merge(
        {
            Name = var.expense_instances[count.index]
        },
        var.common_tags
    )
}


resource "aws_security_group" "allow-ssh" {
    name = "Allow-ssh"
    description = "It allows SSH traffic from everywhere in the world"

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
        Name = "allow_ssh"
        }
    )
}
