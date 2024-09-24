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

variable "ecs_ami"{
  description = "ami to use in the EC2"
  type        = string
}

variable "ecs_instance_type"{
  description = "instance type to use in the EC2"
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