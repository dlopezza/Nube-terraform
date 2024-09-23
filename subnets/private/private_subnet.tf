resource "aws_subnet" "private" {
  vpc_id                = var.vpc_id
  cidr_block            = var.private_subnet_cidr
  availability_zone     = data.aws_availability_zones.available.names[0] 

  tags = {
    Name = "public-subnet"
  }
}

data "aws_availability_zones" "available" {}
