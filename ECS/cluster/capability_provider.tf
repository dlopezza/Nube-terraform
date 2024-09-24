resource "aws_ecs_capacity_provider" "ecs_capacity_provider" {
  name = "terraproject_capacity_provider"

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.ecs_asg.arn

    // Managed termination protection can be either ENABLED or DISABLED
    managed_termination_protection = "ENABLED"

    // Specify the weight for the capacity provider
    weight = 1

    // Optional: You can also define scaling policies if needed
    // scaling_policies {
    //   target_capacity = ...
    //   scale_in_cooldown  = ...
    //   scale_out_cooldown = ...
    // }
  }
}
