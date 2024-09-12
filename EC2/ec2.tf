resource "aws_security_group" "allow_ssh" {

    name = "Allow_ssh"
    description = "It allows connection on port 22 from everywhere"

    egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
  }
   
    ingress {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
  } 
}

resource "aws_instance" "test_instance" {

    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    security_groups = [aws_security_group.allow_ssh.id]

    tags = {
      name = "Test"
    }
  
}