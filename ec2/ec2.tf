# 2nd Creating Instance
resource "aws_instance" "db" {

    ami = "ami-090252cbe067a9e58" #Below security group will execute first (Bcz it needs the value to put here)
    vpc_security_group_ids = [aws_security_group.allow_ssh.id] #Attaching below SG ID
    instance_type = "t2.micro"

    tags = {
        Name = "db"
    }
}

#1st Creating Security Groups
#resource <resource_type>(This Should be from terraform) <resource_name> (Any)

resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh" #Can be same as Above (Takes Random name: if no name provided)
  description = "Allowing SSH Access"

#Having seperate resource of In & Out rules:Like below, We use ingress, egress

#resource "aws_security_group_rule" "example" {  }

  ingress { #In-Bound Rules
    from_port = 22 
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress { #Out-Bound Rules
    from_port = 0 # Opening from all ports
    to_port = 0
    protocol = -1 # From all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
    Created_by = "Mani_Kanta"
  }

}


  #Not given VPC (It takes default vpc)

  # Create a VPC
# resource "aws_vpc" "example" {
#   cidr_block = "10.0.0.0/16"
# }