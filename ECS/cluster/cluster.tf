resource "aws_ecs_cluster" "ecs_cluster" {
  name = "terraproject_cluster"

  capacity_providers = ["terraproject_capacity_provider"]
}