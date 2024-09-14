variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
    type = string
    default = "t2.small"
}

variable "from_port" {
    type = number
    default = 22
}

variable "to_port" {
    type = number
    default = 22
}

variable "ip_range" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
}

variable "protocol" {
    type = string
    default = "tcp"
  
}

variable "tags" {
    type = map
    default = {
      Project = "Expense"
      Environment = "Dev"
      terraform = "True"
    }
}

variable "instance_names" {
    type = list(string)
    default = ["MySQL", "Backend", "Frontend"]
}