# Stage 02 → Stage 03
#
# Resource-shaped module addresses are moved into responsibility-oriented
# boundaries. The AWS objects themselves should not be recreated.

moved {
  from = module.vpc.aws_vpc.main
  to   = module.network.aws_vpc.main
}

moved {
  from = module.vpc.aws_internet_gateway.main
  to   = module.network.aws_internet_gateway.main
}

moved {
  from = module.subnets.aws_subnet.public_a
  to   = module.network.aws_subnet.public_a
}

moved {
  from = module.subnets.aws_subnet.public_b
  to   = module.network.aws_subnet.public_b
}

moved {
  from = module.routing.aws_route_table.public
  to   = module.network.aws_route_table.public
}

moved {
  from = module.routing.aws_route_table_association.public_a
  to   = module.network.aws_route_table_association.public_a
}

moved {
  from = module.routing.aws_route_table_association.public_b
  to   = module.network.aws_route_table_association.public_b
}

moved {
  from = module.security_groups.aws_security_group.alb
  to   = module.edge.aws_security_group.alb
}

moved {
  from = module.load_balancer.aws_lb.app
  to   = module.edge.aws_lb.app
}

moved {
  from = module.load_balancer.aws_lb_target_group.app
  to   = module.edge.aws_lb_target_group.app
}

moved {
  from = module.load_balancer.aws_lb_listener.http
  to   = module.edge.aws_lb_listener.http
}

moved {
  from = module.security_groups.aws_security_group.ecs
  to   = module.runtime.aws_security_group.ecs
}

moved {
  from = module.log_group.aws_cloudwatch_log_group.app
  to   = module.runtime.aws_cloudwatch_log_group.app
}

moved {
  from = module.iam_role.aws_iam_role.ecs_task_execution
  to   = module.runtime.aws_iam_role.ecs_task_execution
}

moved {
  from = module.iam_role.aws_iam_role_policy_attachment.ecs_task_execution
  to   = module.runtime.aws_iam_role_policy_attachment.ecs_task_execution
}

moved {
  from = module.ecs_cluster.aws_ecs_cluster.app
  to   = module.runtime.aws_ecs_cluster.app
}

moved {
  from = module.task_definition.aws_ecs_task_definition.app
  to   = module.runtime.aws_ecs_task_definition.app
}

moved {
  from = module.ecs_service.aws_ecs_service.app
  to   = module.runtime.aws_ecs_service.app
}
