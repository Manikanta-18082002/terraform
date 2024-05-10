#Here count var is not defined. So Locals will not work

# Count and count.index will not work in Locals

# locals {
#   record_name = var.instance_names[count.index] == "frontend" ? var.domain_name : "${var.instance_names[count.index]}.${var.domain_name}" #or dawsmani.site
#   record_value = var.instance_names[count.index] == "frontend" ? [aws_instance.expense[count.index].public_ip ] :  [aws_instance.expense[count.index].private_ip]
# }