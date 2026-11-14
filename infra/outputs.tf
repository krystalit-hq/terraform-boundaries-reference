output "alb_dns_name" {
  description = "DNS name of the public Application Load Balancer."
  value       = module.edge.alb_dns_name
}

output "alb_url" {
  description = "HTTP URL used for the smoke test."
  value       = "http://${module.edge.alb_dns_name}"
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster."
  value       = module.runtime.cluster_name
}

output "ecs_service_name" {
  description = "Name of the ECS service."
  value       = module.runtime.service_name
}

output "log_group_name" {
  description = "CloudWatch log group used by the task."
  value       = module.runtime.log_group_name
}
