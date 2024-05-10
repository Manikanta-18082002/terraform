resource "aws_route53_record" "expense" {
    count = length(var.instance_names)
    zone_id = var.zone-id             #Name: If frontend ? dawsmani.site : db/backend.dawsmani.site
    name = var.instance_names[count.index] == "frontend" ? var.domain_name : "${var.instance_names[count.index]}.${var.domain_name}" #or dawsmani.site
    #name = local.record_name 
    type = "A"
    ttl = 1
    #Count and Count.index will not work in locals

    records = var.instance_names[count.index] == "frontend" ? [aws_instance.expense[count.index].public_ip ] :  [aws_instance.expense[count.index].private_ip]
    # records = local.record_value
    allow_overwrite = true # if records already exists? Then overwrite

}


