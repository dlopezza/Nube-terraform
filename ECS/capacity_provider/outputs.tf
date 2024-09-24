output "capacity_provider_name"{
  description = " capacity provider"
  value       = aws_ecs_capacity_provider.ecs_capacity_provider.name
}