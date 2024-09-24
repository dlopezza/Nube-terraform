variable "ecs_ami"{
  description = "ami to use in the EC2"
  type        = string
}

variable "ecs_instance_type"{
  description = "instance type to use in the EC2"
  type        = string
}

variable "subnet_id" {
  description = "Subnet to be used in ECS"
  type        = string
}
