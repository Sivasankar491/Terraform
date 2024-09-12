resource "aws_instance" "test" {
    ami = var.ami_id
    count = 3
    instance_type = var.instance_type
    #vpc_security_group_ids = [aws_security_group.ssh.id]
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = var.tags
}

#resource "aws_security_group" "ssh" {
resource "aws_security_group" "allow_ssh_terraform" {
    name  = "allow_sshh" #allow_ssh is already there in my account
    description = "Allow port number 22 for SSH access"

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
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.tags
}