output "alb_dns_name" {
  description = "DNS name of the public Application Load Balancer."
  value       = aws_lb.app.dns_name
}

output "alb_url" {
  description = "HTTP URL used for the smoke test."
  value       = "http://${aws_lb.app.dns_name}"
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster."
  value       = aws_ecs_cluster.app.name
}

output "ecs_service_name" {
  description = "Name of the ECS service."
  value       = aws_ecs_service.app.name
}

output "log_group_name" {
  description = "CloudWatch log group used by the task."
  value       = aws_cloudwatch_log_group.app.name
}
