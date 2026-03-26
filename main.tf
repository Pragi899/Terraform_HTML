module "ec2" {
  source               = "./modules/ec2"
  ec2_ami_id           = var.ec2_ami_id
  ec2_instance_type    = var.ec2_instance_type
  ec2_key_pair         = var.ec2_key_pair
  ec2_instance_storage = var.ec2_instance_storage
  subnet_id            = var.subnet_id
  sg_id                = var.security_group_id
}