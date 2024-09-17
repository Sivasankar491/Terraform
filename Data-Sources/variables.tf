variable "from_port" {
    type = number
    default = 22
}

variable "to_port" {
    type = number
    default = 22
}

variable "protocol" {
    type = string
    default = "tcp"
}

variable "ip_range" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
}

