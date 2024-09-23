resource "aws_ecs_task_definition" "ecs_task" {
  family                   = "terraproject_family"
  requires_compatibilities = ["FARGATE"]  # Use "EC2" if not using Fargate
  network_mode             = "awsvpc"      # Required for Fargate
  container_definitions    = jsonencode([{
    name      = var.container_name
    image     = var.image_name
    memory    = 512
    cpu       = 256
    essential = true
    portMappings = [{
      containerPort = var.container_port
      hostPort      = var.host_port
      protocol      = "tcp"
    }]
  }])
}