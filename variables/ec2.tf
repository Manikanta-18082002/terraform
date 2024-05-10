resource "aws_instance" "db" {
    ami = var.image_id #Below security group will execute first (Bcz it needs the value to put here)
    vpc_security_group_ids = [aws_security_group.allow_ssh.id] #Type: List
    instance_type = var.instance_type
    #  Arguments  = Values

    tags = var.tags
}

resource "aws_security_group" "allow_ssh" {
  name = var.sg_name #Can be same as Above (Random name, if no name not provided)
  description = var.sg_description

  ingress { # Thsi is NOT a MAP, It's a Block
    from_port = var.ssh_port
    to_port = var.ssh_port
    protocol = var.protocol
    cidr_blocks = var.allowed_cidr
  }

  egress { #Out-Bound Rules
    from_port = 0 # Opening from all ports
    to_port = 0
    protocol = -1 # From all protocols
    cidr_blocks = var.allowed_cidr
  }

  tags = {
    Name = "allow_ssh"
    Created_by = "Mani_Kanta"
  }

}


