resource "aws_ecs_service" "ecs_service" {
  name            = "terraproject_ecs_service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"  # Use "EC2" if not using Fargate

  network_configuration {
    subnets          = [var.subnet_id]  # Replace with your subnet ID
    security_groups  = [aws_security_group.ecs_service_sg.id]  # Replace with your security group ID
    assign_public_ip = "ENABLED"  # Use "DISABLED" if not needed
  }
}