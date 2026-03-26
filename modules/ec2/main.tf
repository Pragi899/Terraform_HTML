resource "aws_instance" "single" {
  ami                    = var.ec2_ami_id
  instance_type          = var.ec2_instance_type
  vpc_security_group_ids = [var.sg_id]
  key_name               = var.ec2_key_pair
  subnet_id              = var.subnet_id

  #associate_public_ip_address = true

  user_data = file("${path.root}/install_nginx.sh")

  root_block_device {
    volume_size = var.ec2_instance_storage
    volume_type = "gp3"
  }

  tags = {
    Name = "Terraform-HTML"
  }
}