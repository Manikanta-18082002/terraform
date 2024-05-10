resource "aws_instance" "db" {
    #count = 3
    count = length(var.instance_name)
    ami = "ami-090252cbe067a9e58" 
    instance_type = "t3.micro"

    tags = {
        Name = var.instance_name[count.index] # 1st time takes 0th index values, 1, 2
    }
}

resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh" #Can be same as Above (Random name, if no name not provided)
  description = "Allowing SSH Access"

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