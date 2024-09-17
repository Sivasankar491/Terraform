data "aws_ami" "devops" {
    most_recent      = true
    owners           = ["973714476881"]

    # filter {
    #     name   = "name"
    #     values = ["myami-*"]
    # }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    # filter {
    #     name = "Architecture"
    #     values = ["x86_64"]
    # }
  
}