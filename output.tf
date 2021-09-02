output "subnet_web_ids" {
  value = [aws_subnet.tier-private-subnet-1.id, aws_subnet.tier-private-subnet-2.id]
  description = "public subnet Id List"
}

output "web-sg-id" {
  value = aws_security_group.web-lc-sg.id
  description = "bastion security group id"
}

output "bastion_public_ip" {
  value = aws_instance.bastion-ec2.public_ip
  description = "bastion public ip address"
}

output "alb_dns" {
  value = aws_lb.tier-alb.dns_name
  description = "alb dns name"
}