variable "instance_type" {
    type = map
    default = {
        MySQL = "t2.small"
        Backend = "t3.micro"
        Frontend = "t2.micro"
    }
}