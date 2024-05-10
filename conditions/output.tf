output "public_ip" {
    value = aws_instance.db.public_ip #OR  aws_instance.db
  
}