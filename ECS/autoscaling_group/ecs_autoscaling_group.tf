resource "aws_autoscaling_group" "ecs_asg" {
  desired_capacity     = 1
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier = [var.subnet_id]  # Ensure this is a public subnet
  launch_configuration = aws_launch_configuration.ecs_launch_configuration.id

  tag {
    key                 = "Name"
    value               = "ecs-instance"
    propagate_at_launch = true
  }
}
