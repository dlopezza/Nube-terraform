resource "aws_ecs_service" "ecs_service" {
  name            = "terraproject_ecs_service"
  cluster         = var.cluster_id
  task_definition = var.ecs_task_arn
  desired_count   = 1
  launch_type     = "EC2"  # Use "EC2" if not using Fargate

  #network_configuration {
   # subnets          = [var.subnet_id]  # Replace with your subnet ID
    #security_groups  = [aws_security_group.ecs_service_sg.id]  # Replace with your security group ID
    #assign_public_ip = true 
  #}
}