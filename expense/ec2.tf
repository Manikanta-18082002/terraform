resource "aws_instance" "expense" {
    count = length(var.instance_names)
    ami = var.image_id 
    vpc_security_group_ids = [aws_security_group.allow_ssh.id] #Type: List
    instance_type = var.instance_names[count.index] == "db" ? "t3.small" : "t3.micro"

    tags = merge(
      var.common_tags,
      {
        Name = var.instance_names[count.index]
        Module = var.instance_names[count.index]
      }
    )
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


