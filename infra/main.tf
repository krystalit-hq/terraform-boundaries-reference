data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source      = "./modules/vpc"
  name_prefix = local.name_prefix
}

module "subnets" {
  source = "./modules/subnets"

  vpc_id             = module.vpc.vpc_id
  availability_zones = data.aws_availability_zones.available.names
  name_prefix        = local.name_prefix
}

module "routing" {
  source = "./modules/routing"

  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.vpc.internet_gateway_id
  public_subnet_ids   = module.subnets.public_subnet_ids
  name_prefix         = local.name_prefix
}

module "security_groups" {
  source = "./modules/security-groups"

  vpc_id      = module.vpc.vpc_id
  name_prefix = local.name_prefix
}

module "log_group" {
  source      = "./modules/log-group"
  name_prefix = local.name_prefix
}

module "iam_role" {
  source      = "./modules/iam-role"
  name_prefix = local.name_prefix
}

module "load_balancer" {
  source = "./modules/load-balancer"

  name_prefix       = local.name_prefix
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.subnets.public_subnet_ids
  security_group_id = module.security_groups.alb_security_group_id
}

module "ecs_cluster" {
  source      = "./modules/ecs-cluster"
  name_prefix = local.name_prefix
}

module "task_definition" {
  source = "./modules/task-definition"

  name_prefix        = local.name_prefix
  aws_region         = var.aws_region
  container_image    = var.container_image
  execution_role_arn = module.iam_role.execution_role_arn
  log_group_name     = module.log_group.log_group_name
}

module "ecs_service" {
  source = "./modules/ecs-service"

  name_prefix         = local.name_prefix
  cluster_id          = module.ecs_cluster.cluster_id
  task_definition_arn = module.task_definition.task_definition_arn
  public_subnet_ids   = module.subnets.public_subnet_ids
  security_group_id   = module.security_groups.ecs_security_group_id
  target_group_arn    = module.load_balancer.target_group_arn

  depends_on = [
    module.load_balancer,
    module.iam_role,
  ]
}
