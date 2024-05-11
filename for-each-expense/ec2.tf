resource "aws_instance" "expense" {
    for_each = var.instance_names  # each.key and each.value
    ami =data.aws_ami.ami_info.id
    vpc_security_group_ids = ["sg-00fdfc2b0e8a3e6e9"] #Type: List
    instance_type = each.value
    tags = merge(
      var.common_tags,
      {
        Name = each.key
        Module = each.key
      }
    )
}

# Use count --> (List) when using count
# Use for --> (Maps) when using for