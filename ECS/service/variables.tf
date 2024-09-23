variable "subnet_id" {
  description = "Subnet to be used in ECS"
  type        = string
}

variable "cluster_id"{
  description = "cluster id"
  type        = string
}

variable "ecs_task_arn"{
  description = "arn of the ecs task definition"
  type        = string
}