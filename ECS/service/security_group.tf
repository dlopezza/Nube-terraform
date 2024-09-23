resource "aws_security_group" "ecs_service_sg" {
  name        = "ecs_service_sg"
  description = "Security group for ECS service"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Adjust this as needed for security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allows all traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}
