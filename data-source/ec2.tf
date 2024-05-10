resource "aws_instance" "db" {
    ami =data.aws_ami.ami_id.id
    vpc_security_group_ids = ["ami-090252cbe067a9e58" ]
    instance_type = "t3.micro"

    tags = {
        name = "data-source-practice"
    }
}

