variable "image_id" { 
    type = string 
    default = "ami-090252cbe067a9e58"
    description = "RHEL-9 AMI ID" #Optional
}

variable "instance_type" {
    type = string # Give this to enter only string to debug easy (If any one entered int)
    default = "t2.micro"
}

variable "tags" { #Tags are useful: for future reference to get full info, taging strategy
    default = {
        Project = "Expense"
        Environment = "DEV"
        Module = "DB"
        Name = "DB"
    }
}

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