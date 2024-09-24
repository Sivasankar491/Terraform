variable "expense_instances" {
  type = map(any)
  default = {
    MySQL    = "t2.small"
    Backend  = "t3.micro"
    Frontend = "t2.micro"
  }
}

variable "from_port" {
  type    = number
  default = 22
}

variable "to_port" {
  type    = number
  default = 22
}

variable "ip_range" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "protocol" {
  type    = string
  default = "tcp"
}

variable "common_tags" {
  type = map(any)
  default = {
    Project   = "Expense"
    Terraform = "true"
  }
}