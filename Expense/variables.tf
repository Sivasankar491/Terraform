variable "expense_instances" {
    type = list(string)
    default = [ "MySQL", "Backend", "Frontend" ]  
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

variable "common_tags" {
    type = map
    default = {
        Project = "Expense"
        Environment = "Dev"
        terraform = "True"
    }
}