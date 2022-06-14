# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.70"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.7"
    }    
  }

  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-on-aws-eks-3602"
    key    = "dev/app1k8s/terraform.tfstate"
    region = "us-east-1" 

    # For State Locking
    dynamodb_table = "dev-app1k8s"    
  } 
}
  