module "vpc" {
  source = "../../modules/vpc"

  vpc_name       = var.vpc_name
  vpc_cidr       = var.vpc_cidr
  private_subnets = var.private_subnets
  tags           = var.tags
}

module "ec2" {
  source = "../../modules/ec2"

  instance_name = var.instance_name
  instance_type = var.instance_type
  subnet_id     = module.vpc.private_subnet_ids[0]
  security_group_ids = var.security_group_ids
  iam_instance_profile_name = var.iam_instance_profile_name
  team          = var.team

  root_volume_size = var.root_volume_size

  tags = var.tags

  depends_on = [module.vpc]
}

