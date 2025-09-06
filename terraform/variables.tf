variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}


variable "ecr_repo" {
  description = "ERC Repository"
  default     = "gitops-webapp"
}

variable "cluster_name" {
  description = "Cluster Name"
  default     = "gitops-cluster"
}

variable "cluster_version" {
  description = "cluster version"
  default     = "1.31"
}

variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  default     = "10.0.0.0/16"
}

variable "private_subnets_cidr_blocks" {
  description = "Private Subnets CIDR Blocks"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets_cidr_blocks" {
  description = "Public Subnets CIDR Blocks"
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "tags" {
  description = "Tags"
  default = {
    "Environment" = "gitops"
    "Project"     = "gitops-webapp"
  }
}