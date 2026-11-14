resource "aws_subnet" "public_a" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.42.1.0/24"
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true
  tags                    = { Name = "${var.name_prefix}-public-a" }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.42.2.0/24"
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true
  tags                    = { Name = "${var.name_prefix}-public-b" }
}
