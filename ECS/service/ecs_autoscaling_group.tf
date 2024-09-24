.resource "aws_autoscaling_group" "ecs_asg" {
  desired_capacity     = 1  # Set the number of instances you want
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier = [var.subnet_id]  # Use your public subnet ID
  launch_configuration = aws_launch_configuration.ecs_launch_configuration.id

  tags = [
    {
      key                 = "Name"
      value               = "ecs-instance"
      propagate_at_launch = true
    },
  ]
}
