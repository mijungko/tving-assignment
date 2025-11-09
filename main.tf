module "vpc" {
  source = "./modules/vpc"

  vpc_name       = var.vpc_name
  vpc_cidr       = var.vpc_cidr
  private_subnets = var.private_subnets
  tags           = var.tags
}

module "ec2" {
  for_each = var.instances

  source = "./modules/ec2"

  instance_name = each.value.instance_name
  instance_type = each.value.instance_type
  architecture  = each.value.architecture
  subnet_id     = each.value.subnet_id != null ? each.value.subnet_id : module.vpc.private_subnet_ids[each.value.subnet_index]
  security_group_ids = each.value.security_group_ids
  iam_instance_profile_name = each.value.iam_instance_profile_name
  team          = each.value.team

  root_volume_size = each.value.root_volume_size
  additional_ebs_volumes = each.value.additional_ebs_volumes

  tags = merge(var.tags, each.value.tags)

  depends_on = [module.vpc]
}