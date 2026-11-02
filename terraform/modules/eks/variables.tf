variable "project" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "cluster_version" {
  type = string
}

variable "node_instance_type" {
  type = string
}

variable "node_scaling" {
  type = object({
    desired = number
    min     = number
    max     = number
  })
}
