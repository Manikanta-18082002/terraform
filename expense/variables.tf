#EC2- variables
variable "instance_names" {
    type = list
    default = ["db", "backend", "frontend"]
}


variable "image_id" { 
    type = string # Give this to enter only string to debug easy (If any one entered int)
    default = "ami-090252cbe067a9e58"
    description = "RHEL-9 AMI ID" #Optional
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "common_tags" {
    default = {
        Project = "Expense"
        Environment = "DEV"
        Terraform  = "true"
    }
}

# sg- Variables
variable "sg_name" {
    default = "allow_ssh"
}

variable "sg_description" {
    default = "Allowing Port 22"
}

variable "ssh_port" {
    default = 22
}

variable "protocol" {
    default = "tcp"
}

variable "allowed_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"] #List of String
  
}

#Route- 53 Variables
variable "zone-id" {
    default = "Z0518893283P6UJCL06B2"
  
}

variable "domain_name" {
    default = "dawsmani.site"
  
}