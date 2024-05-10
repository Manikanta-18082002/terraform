resource "aws_instance" "db" {
    ami = var.image_id             #Condition ? true : false       
    instance_type = var.instance_name == "db" ? "t3.small" : "t3.micro"  #Conditional Expression

    #Default security group will be taken
    # vpc_security_group_ids = [aws_security_group.allow_ssh.id] #Type: List
    

}
