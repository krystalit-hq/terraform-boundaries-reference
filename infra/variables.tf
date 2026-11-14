variable "aws_region" {
  description = "AWS region used by the reference stack."
  type        = string
  default     = "eu-central-1"
}

variable "environment" {
  description = "Environment label used in names and tags."
  type        = string
  default     = "dev"
}

variable "container_image" {
  description = "Public container image used by the ECS task."
  type        = string
  default     = "public.ecr.aws/nginx/nginx:mainline-alpine3.24-otel"
}
