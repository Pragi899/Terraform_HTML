variable "ec2_ami_id" {}
variable "ec2_instance_type" {}
variable "ec2_key_pair" {}
variable "ec2_instance_storage" {}
variable "security_group_id" {
  description = "Existing security group ID"
}
variable "subnet_id" {}
variable "vpc_id" {}
variable "public_subnet_ids" {}
