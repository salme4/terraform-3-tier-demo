resource "aws_route_table" "tier-pub-rt" {
  vpc_id = aws_vpc.tier-vpc.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.tier-igw.id
  }

  tags = {
    Name = "${var.resource_prefix}-PUB-RT"
  }
}

resource "aws_route_table_association" "pub-1" {
  subnet_id = aws_subnet.tier-public-subnet-1.id
  route_table_id = aws_route_table.tier-pub-rt.id
}

resource "aws_route_table_association" "pub-mgmt" {
  subnet_id = aws_subnet.tier-public-subnet-mgmt.id
  route_table_id = aws_route_table.tier-pub-rt.id
}

resource "aws_route_table" "tier-prv-rt" {
  vpc_id = aws_vpc.tier-vpc.id
  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.tier-nat.id
  }
  tags = {
    Name = "${var.resource_prefix}-PRV-RT"
  }
}

resource "aws_route_table_association" "prv-1" {
  subnet_id = aws_subnet.tier-private-subnet-1.id
  route_table_id = aws_route_table.tier-prv-rt.id
}

resource "aws_route_table_association" "prv-2" {
  subnet_id = aws_subnet.tier-private-subnet-2.id
  route_table_id = aws_route_table.tier-prv-rt.id
}

resource "aws_route_table_association" "db-1" {
  subnet_id = aws_subnet.tier-db-subnet-1.id
  route_table_id = aws_route_table.tier-prv-rt.id
}

resource "aws_route_table_association" "db-2" {
  subnet_id = aws_subnet.tier-db-subnet-2.id
  route_table_id = aws_route_table.tier-prv-rt.id
}
