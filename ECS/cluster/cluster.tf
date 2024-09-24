resource "aws_ecs_cluster" "ecs_cluster" {
  name = "terraproject_cluster"

  capacity_providers = [aws_ecs_capacity_provider.ecs_capacity_provider.name]
}