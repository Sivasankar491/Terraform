variable "ami_id" {
    default = "ami-09c813fb71547fc4f" 
}

variable "instance_type" {
    default = "t2.micro"  
}

variable "from_port" {
    default = 22
}

variable "to_port" {
    default = 22
}

variable "protocol" {
    default = "tcp"
}

variable "tags" {

    default = {
        Name = "Backend"
    }
  
}