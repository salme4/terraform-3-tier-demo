resource "aws_launch_configuration" "tier-launch-configuration" {
  name   = "${var.resource_prefix}-LAUNCH-CONFIGURATION"
  image_id      = data.aws_ami.nginx-web.id
  instance_type = var.web_instance_type

  key_name = var.bastion_key_pair_name

  associate_public_ip_address = false
  security_groups = [aws_security_group.web-lc-sg.id]

  user_data = <<-EOF
            #!/bin/bash
            sudo service nginx start
            EOF
}

resource "aws_autoscaling_group" "tier-autoscaling-group" {
  name = "${var.resource_prefix}-AUTO-SCALING"
  launch_configuration = aws_launch_configuration.tier-launch-configuration.name
  vpc_zone_identifier = [aws_subnet.tier-private-subnet-1.id, aws_subnet.tier-private-subnet-2.id]

  force_delete = true

  desired_capacity   = 2
  max_size           = 4
  min_size           = 2

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "${var.resource_prefix}-ASG-EC2"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "tier-asg-attachment" {
  autoscaling_group_name = aws_autoscaling_group.tier-autoscaling-group.id
  alb_target_group_arn   = aws_lb_target_group.tier-alb-target-group.arn
}