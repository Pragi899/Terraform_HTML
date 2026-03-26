data "aws_subnet" "private" {
  id = var.subnet_id
}

locals {
  vpc_id = data.aws_subnet.private.vpc_id
}

module "ec2" {
  source               = "./modules/ec2"
  ec2_ami_id           = var.ec2_ami_id
  ec2_instance_type    = var.ec2_instance_type
  ec2_key_pair         = var.ec2_key_pair
  ec2_instance_storage = var.ec2_instance_storage
  subnet_id            = var.subnet_id
  sg_id                = var.security_group_id
  vpc_id               = local.vpc_id
}

module "alb" {
  source = "./modules/alb"

  vpc_id            = local.vpc_id
  public_subnet_ids = var.public_subnet_ids
  instance_id       = module.ec2.instance_id
}