resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name = "terraproject-ecs-logs"
  retention_in_days = 7  # Adjust retention as needed
}