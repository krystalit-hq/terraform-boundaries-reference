locals {
  project_name = "terraform-boundaries-reference"
  name_prefix  = "${local.project_name}-${var.environment}"

  common_tags = {
    Project     = local.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Repository  = local.project_name
    Stage       = "01-works"
  }
}
