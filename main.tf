resource "aws_vpc" "vpc-terraproject" {

 cidr_block           = "10.0.0.0/16"

 enable_dns_hostnames = true

 tags = {

   name = "vpc-terraproject"

 }

}

resource "aws_subnet" "public_subnet" {

 vpc_id                  = aws_vpc.vpc-terraproject.id

 cidr_block              = "10.0.1.0/24"

 map_public_ip_on_launch = true

 availability_zone       = "us-east-1"

}


resource "aws_subnet" "private_subnet" {

 vpc_id                  = aws_vpc.vpc-terraproject.id

 cidr_block              = "10.0.2.0/24"

 availability_zone       = "us-east-1"

}

resource "aws_internet_gateway" "internet_gateway" {

 vpc_id = aws_vpc.vpc-terraproject.id

 tags = {

   Name = "internet_gateway"

 }

}

resource "aws_route_table" "route_table" {

 vpc_id = aws_vpc.vpc-terraproject.id

 route {

   cidr_block = "0.0.0.0/0"

   gateway_id = aws_internet_gateway.internet_gateway.id

 }

}



resource "aws_route_table_association" "public_subnet_route" {

 subnet_id      = aws_subnet.public_subnet.id

 route_table_id = aws_route_table.route_table.id

}

resource "aws_security_group" "ecs_service_sg" {
  name        = "ecs_service_sg"
  description = "Security group for ECS service"
  vpc_id      = aws_vpc.vpc-terraproject.id

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

