locals {
  ami_id = "ami-090252cbe067a9e58"
  sg_id = "sg-00fdfc2b0e8a3e6e9"
  #instance_type = "t3.micro"
  instance_type = var.instance_name == "db" ? "t3.small" : "t3.micro"

  tags = {
    Name = "locals"
  }
}

#Ex: Line 5: We can use variables inside locals. But not variables/locals inside variables.