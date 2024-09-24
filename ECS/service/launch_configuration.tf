resource "aws_launch_configuration" "ecs_launch_configuration" {
  name          = "ecs-launch-configuration"
  image_id      = var.ecs_ami
  instance_type = var.ecs_instance_type

  security_groups = [aws_security_group.ecs_service_sg.id]

  lifecycle {
    create_before_destroy = true
  }
}
