data "aws_ami" "amazon-linux2" {
  most_recent = true
  owners = ["137112412989"] //Amazon Linux 2 AMI Owner ID

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-2*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

data "aws_ami" "nginx-web" {
  most_recent = true
  owners = ["self"]

  filter {
    name = "name"
    values = ["NGINX*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}