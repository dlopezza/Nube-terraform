# Data block to get available availability zones
data "aws_availability_zones" "available" {}

# VPC Resource
resource "aws_vpc" "vpc_terraproject" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-terraproject"
  }
}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                = aws_vpc.vpc_terraproject.id  # Use VPC ID from the VPC resource
  cidr_block            = "10.0.1.0/24"  # CIDR block for the public subnet
  availability_zone     = data.aws_availability_zones.available.names[0]  # Use the first availability zone

  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id                = aws_vpc.vpc_terraproject.id  # Use VPC ID from the VPC resource
  cidr_block            = "10.0.2.0/24"  # CIDR block for the private subnet
  availability_zone     = data.aws_availability_zones.available.names[1]  # Use the second availability zone

  tags = {
    Name = "private-subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc_terraproject.id

  tags = {
    Name = "internet_gateway"
  }
}

# Route Table
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc_terraproject.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
}

# Associate Route Table with Public Subnet
resource "aws_route_table_association" "public_subnet_route" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table.id
}

# Security Group for ECS Service
resource "aws_security_group" "ecs_service_sg" {
  name        = "ecs_service_sg"
  description = "Security group for ECS service"
  vpc_id      = aws_vpc.vpc_terraproject.id

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allows all traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}
