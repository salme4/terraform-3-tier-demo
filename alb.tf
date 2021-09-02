resource "aws_lb" "tier-alb" {
  name = "${var.resource_prefix}-ALB"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.web-alb-sg.id]
  subnets = [aws_subnet.tier-public-subnet-1.id, aws_subnet.tier-public-subnet-mgmt.id]
}

resource "aws_lb_target_group" "tier-alb-target-group" {
  name = "${var.resource_prefix}-WEB-SERVER-TG"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.tier-vpc.id
}

resource "aws_lb_listener" "tier-alb-listener" {
  load_balancer_arn = aws_lb.tier-alb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tier-alb-target-group.arn
  }
}