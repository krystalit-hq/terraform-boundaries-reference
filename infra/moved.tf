moved {
  from = aws_vpc.main
  to   = module.vpc.aws_vpc.main
}

moved {
  from = aws_internet_gateway.main
  to   = module.vpc.aws_internet_gateway.main
}

moved {
  from = aws_subnet.public_a
  to   = module.subnets.aws_subnet.public_a
}

moved {
  from = aws_subnet.public_b
  to   = module.subnets.aws_subnet.public_b
}

moved {
  from = aws_route_table.public
  to   = module.routing.aws_route_table.public
}

moved {
  from = aws_route_table_association.public_a
  to   = module.routing.aws_route_table_association.public_a
}

moved {
  from = aws_route_table_association.public_b
  to   = module.routing.aws_route_table_association.public_b
}

moved {
  from = aws_security_group.alb
  to   = module.security_groups.aws_security_group.alb
}

moved {
  from = aws_security_group.ecs
  to   = module.security_groups.aws_security_group.ecs
}

moved {
  from = aws_cloudwatch_log_group.app
  to   = module.log_group.aws_cloudwatch_log_group.app
}

moved {
  from = aws_iam_role.ecs_task_execution
  to   = module.iam_role.aws_iam_role.ecs_task_execution
}

moved {
  from = aws_iam_role_policy_attachment.ecs_task_execution
  to   = module.iam_role.aws_iam_role_policy_attachment.ecs_task_execution
}

moved {
  from = aws_lb.app
  to   = module.load_balancer.aws_lb.app
}

moved {
  from = aws_lb_target_group.app
  to   = module.load_balancer.aws_lb_target_group.app
}

moved {
  from = aws_lb_listener.http
  to   = module.load_balancer.aws_lb_listener.http
}

moved {
  from = aws_ecs_cluster.app
  to   = module.ecs_cluster.aws_ecs_cluster.app
}

moved {
  from = aws_ecs_task_definition.app
  to   = module.task_definition.aws_ecs_task_definition.app
}

moved {
  from = aws_ecs_service.app
  to   = module.ecs_service.aws_ecs_service.app
}
