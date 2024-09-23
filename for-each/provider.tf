terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# terraform {
#   backend "s3" {
#     bucket = "chinnas3"
#     key    = "for-each-loop"
#     region = "ap-south-1"
#     dynamodb_table = "chinnatable"
#   }
# }


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}