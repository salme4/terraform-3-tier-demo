variable "region" {
  default = "ap-northeast-2"
  description = "Amazon Region"
}
variable "resource_prefix" {
  default = "DevOS"
  description = "resource name prefix"
  type = string
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
  description = "vpc CIDR Range"
}

variable "subnet_cidr" {
  default = "10.0.1.0/20"
  description = "subnet CIDR Range"
}

variable "bastion_instance_type" {
  default = "t2.micro"
  description = "EC2 Bastion Instance Type"
}

variable "web_instance_type" {
  default = "t2.micro"
  description = "EC2 Web Server Instance Type"
}

variable "bastion_key_pair_name" {
  default = "devos-seoul-keypair"
  description = "EC2 Instance Key Pair Name"
}