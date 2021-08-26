output "bastion_public_ip" {
  value = aws_instance.bastion-ec2.public_ip
  description = "bastion public ip address"
}

output "alb_dns" {
  value = aws_lb.tier-alb.dns_name
  description = "alb dns name"
}