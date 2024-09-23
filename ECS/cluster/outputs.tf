output "cluster_id" {
  description = "The ID of the private subnet"
  value       = aws_ecs_cluster.ecs_cluster.id
}
