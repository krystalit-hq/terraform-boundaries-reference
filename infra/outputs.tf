output "alb_dns_name" {
  value = module.load_balancer.alb_dns_name
}

output "alb_url" {
  value = "http://${module.load_balancer.alb_dns_name}"
}

output "ecs_cluster_name" {
  value = module.ecs_cluster.cluster_name
}

output "ecs_service_name" {
  value = module.ecs_service.service_name
}

output "log_group_name" {
  value = module.log_group.log_group_name
}
