variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
}
