terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">= 5.0"
    }
  }

  backend "s3" {
    bucket = var.tf_state_bucket
    key = "${var.env_name}/terraform.tfstate"
    region = var.aws_region
    dynamodb_table = var.tf_lock_table
    encrypt = true 
  }
}

provider "aws" {
  region = var.aws_region
}

