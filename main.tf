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

module "ecs_cluster" {
  source = "./ECS/cluster" 
}

module "ecs_task_definition" {
  source = "./ECS/definition"
  container_port = 3000
  host_port = 3000
  image_name = "colingas/my-nextjs-app"
  container_name = "terraproject_containter"
}

module "ecs_service" {
  source              = "./ECS/service"
  subnet_id           = module.private_subnet.private_subnet_id
  cluster_id          = module.ecs_cluster.cluster_id
  ecs_task_arn        = module.ecs_task_definition.ecs_task_arn
}