variable "container_name" {
  description = "The container name for the webapp"
  type        = string
  default     = ""
}

variable "image_name" {
  description = "The image name used in the iamge repository"
  type        = string
  default     = "nginx"
}

variable "container_port" {
  description = "Port to use both in the host and container"
  type        = number
  default     = 3000
}

variable "host_port" {
  description = "Port to use both in the host and container"
  type        = number
  default     = 3000
}

variable "subnet_id" {
  description = "Subnet to be used in ECS"
  type        = string
  default     = ""
}