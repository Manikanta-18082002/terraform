variable "image_id" { 
    type = string # Give this to enter only string to debug easy (If any one entered int)
    default = "ami-090252cbe067a9e58"
    description = "RHEL-9 AMI ID" #Optional
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "instance_name" {
    default = "db"
}