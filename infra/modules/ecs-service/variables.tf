variable "name_prefix" { type = string }
variable "cluster_id" { type = string }
variable "task_definition_arn" { type = string }
variable "public_subnet_ids" { type = list(string) }
variable "security_group_id" { type = string }
variable "target_group_arn" { type = string }
