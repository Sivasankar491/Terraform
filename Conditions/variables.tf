variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
}

variable "instance_names" {
    type = list(string)
    default = [ "MySQL", "Backend", "Frontend" ]
}

# variable "instance_type" {
#     type = string
#     default = "t2.micro"
# }

variable "environment" {
    type = string
    default = "UAT"
}

variable "common_tags" {
    type = map
    default = {
        Project = "Expense"
        Terraform = "True"
    }
}

variable "to_port" {
    type = number
    default = 22
}

variable "from_port" {
    type = number
    default = 22
}

variable "ingress_protocol" {
    type = string
    default = "tcp"
}

variable "ip_range" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
}

