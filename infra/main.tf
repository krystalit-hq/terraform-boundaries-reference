data "aws_availability_zones" "available" {
  state = "available"
}

module "network" {
  source = "./modules/network"

  name_prefix        = local.name_prefix
  availability_zones = data.aws_availability_zones.available.names
}

module "edge" {
  source = "./modules/edge"

  name_prefix       = local.name_prefix
  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
}

module "runtime" {
  source = "./modules/runtime"

  name_prefix           = local.name_prefix
  aws_region            = var.aws_region
  container_image       = var.container_image
  vpc_id                = module.network.vpc_id
  public_subnet_ids     = module.network.public_subnet_ids
  alb_security_group_id = module.edge.alb_security_group_id
  target_group_arn      = module.edge.target_group_arn
}
