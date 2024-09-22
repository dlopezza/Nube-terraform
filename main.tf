terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./vpc"
 }

 module "public_subnet" {
  source               = "./subnets/public"
  vpc_id               = module.vpc.vpc_id 
  public_subnet_cidr   = "10.0.1.0/24"
}

module "private_subnet" {
  source               = "./subnets/private"
  vpc_id               = module.vpc.vpc_id 
  private_subnet_cidr  = "10.0.2.0/24"
}