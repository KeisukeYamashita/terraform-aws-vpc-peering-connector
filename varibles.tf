variable "auto_accept" {
  type        = bool
  default     = false
  description = "Accept VPC peering automatically"
}

variable "route_table_id" {
  type        = string
  description = "ID of the route table to associate"
}

variable "target_cidr_block" {
  type        = string
  description = "CIDR block of the target VPC"
}

variable "target_peering_id" {
  type        = string
  description = "ID of the peering target"
}
