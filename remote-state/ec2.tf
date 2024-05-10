resource "aws_instance" "db" {

    ami = "ami-090252cbe067a9e58"
    vpc_security_group_ids = ["sg-00fdfc2b0e8a3e6e9"]
    instance_type = "t2.micro"

    tags = {
        Name = "db"
    }
}