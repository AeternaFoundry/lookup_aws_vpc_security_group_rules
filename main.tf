data "aws_vpc_security_group_rules" "vpc_security_group_rules_lookup" {
  for_each = var.vpc_security_group_rules_lookup

  region = each.value.region
  tags   = each.value.tags

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}

