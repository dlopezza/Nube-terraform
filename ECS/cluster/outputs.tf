output "cluster_id" {
  description = "The ID of the private subnet"
  value       = aws_ecs_cluster.ecs_cluster.id
}

output "capacity_provider_name"{
  description = " capacity provider"
  value       = aws_ecs_capacity_provider.ecs_capacity_provider.name
}