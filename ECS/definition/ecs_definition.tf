resource "aws_ecs_task_definition" "ecs_task" {
  family                   = "terraproject_family"
  requires_compatibilities = ["EC2"]  # Use "EC2" if not using Fargate
  network_mode             = "awsvpc"      # Required for Fargate
  cpu                      = 1024
  memory                   = 2048
  execution_role_arn        = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn             = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = <<TASK_DEFINITION
[
  {
    "name": "${var.container_name}",
    "image": "${var.image_name}",
    "cpu": 1024,
    "memory": 2048,
    "essential": true,
    "portMappings": [
      {
        "containerPort": ${var.container_port},
        "hostPort": ${var.host_port},
        "protocol": "tcp"
      }
    ]
  }
]
TASK_DEFINITION

  runtime_platform {
    operating_system_family = "LINUX"  # Update to match your environment (e.g., "WINDOWS_SERVER_2019_CORE" if using Windows)
    cpu_architecture        = "X86_64"
  }
}
