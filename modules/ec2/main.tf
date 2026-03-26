resource "aws_launch_template" "lt" {
  name_prefix   = "terraform-lt"
  image_id      = var.ec2_ami_id
  instance_type = var.ec2_instance_type
  key_name      = var.ec2_key_pair

  user_data = base64encode(file("install_nginx.sh"))

  network_interfaces {
    security_groups = [var.sg_id]
  }
}


resource "aws_autoscaling_group" "asg" {
  desired_capacity = 2
  max_size         = 3
  min_size         = 1

  vpc_zone_identifier = [var.subnet_id]

  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]

  health_check_type = "EC2"
}

