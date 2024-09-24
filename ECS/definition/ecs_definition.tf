resource "aws_ecs_task_definition" "ecs_task" {
  family                   = "terraproject_family"
  requires_compatibilities = ["EC2"]  # Use "FARGATE" for Fargate launch type
  network_mode             = "bridge"      # Required for Fargate
  cpu                      = "1024"         # CPU value as a string
  memory                   = "2048"         # Memory value as a string
  execution_role_arn       = "arn:aws:iam::587298106973:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"

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
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${aws_cloudwatch_log_group.ecs_log_group.name}",
        "awslogs-region": "us-east-1",
        "awslogs-stream-prefix": "ecs"
      }
    }
  }
]
TASK_DEFINITION

  runtime_platform {
    operating_system_family = "LINUX"  # Update to match your environment
    cpu_architecture        = "X86_64"
  }
}
