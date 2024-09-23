resource "aws_subnet" "public" {
  vpc_id                = var.vpc_id  # Use the passed VPC ID
  cidr_block            = var.public_subnet_cidr  # Directly reference the single CIDR block variable
  availability_zone     = data.aws_availability_zones.available.names[0]  # Use the first availability zone

  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

data "aws_availability_zones" "available" {}
