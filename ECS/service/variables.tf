variable "cluster_id"{
  description = "cluster id"
  type        = string
}

variable "ecs_task_arn"{
  description = "arn of the ecs task definition"
  type        = string
}


variable "vpc_id"{
  description = "id of the vpc"
  type        = string
}

variable "capacity_provider_name"{
  description = "name of the capacity provider"
  type        = string
}