# VPC for cluster
data "aws_availability_zones" "azs" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.2.0"

  name = var.cluster_name
  cidr = var.vpc_cidr_block

  azs             = data.aws_availability_zones.azs.names
  private_subnets = var.private_subnets_cidr_blocks
  public_subnets  = var.public_subnets_cidr_blocks

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }

  tags = var.tags
}


## EKS Cluster###
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name                   = var.cluster_name
  kubernetes_version     = var.cluster_version
  endpoint_public_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets


  create_node_security_group               = false
  enable_cluster_creator_admin_permissions = true


  # Node Pool
  compute_config = {
    enabled                  = true
    node_pools               = ["general-purpose"]
    node_pool_name           = "general-purpose"
    node_pool_version        = var.cluster_version
    node_pool_instance_types = ["t3.small"]
    node_pool_min_size       = 1
    node_pool_max_size       = 3
    node_pool_desired_size   = 2
  }



  tags = var.tags
}


# ECR Repository
module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "2.0.0"

  repository_name    = var.ecr_repo
  registry_scan_type = "BASIC"
  repository_type    = "PRIVATE"

  create_lifecycle_policy = false

  tags = {
    Terraform = "true"
  }
}
