output "ecs_task_arn"{
    description = "arn of the task"
    value = aws_ecs_task_definition.ecs_task.arn
}