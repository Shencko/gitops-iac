terraform {
  required_version = "~> 1.0"
  backend "s3" {
    bucket = "terraform-state-bucket028"
    key    = "gitops-action/state.tfstate"
    region = "us-west-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.9.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.3"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.16"
    }
  }
}