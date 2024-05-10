variable "instance_names" {
    type = map
    default = {
        db = "t2.small"
        backend = "t2.micro"
        frontend = "t2.micro"
    }
}

variable "common_tags" {
    type = map
    default = {
        Project = "Expense"
        Terraform = "true"
    }
}

variable "domain_name" {
    default = "dawsmani.site"
}

variable "zone_id" {
    default = "Z0518893283P6UJCL06B2"
}