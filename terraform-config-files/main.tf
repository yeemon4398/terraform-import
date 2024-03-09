# VPC - myvpc
resource "aws_vpc" "myvpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "myvpc"
  }
}

# Internet Gateway - myigw
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "myigw"
  }
}

# Public subnet - mypublicsubnet
resource "aws_subnet" "mypublicsubnet" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "mypublicsubnet"
  }
}

# Private subnet - myprivatesubnet
resource "aws_subnet" "myprivatesubnet" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name = "myprivatesubnet"
  }
}

# Route table - myroutetable
resource "aws_route_table" "myroutetable" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "myroutetable"
  }
}

# Route to internet - publicroute
resource "aws_route" "publicroute" {
  route_table_id         = aws_route_table.myroutetable.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.myigw.id
}

# Route table and subnet association
resource "aws_route_table_association" "snrtassociate" {
  subnet_id      = aws_subnet.mypublicsubnet.id
  route_table_id = aws_route_table.myroutetable.id
}
