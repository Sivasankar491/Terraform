terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  backend "s3"{
    bucket                 = "ayra-practice-bktt"
    region                 = "us-east-1"
    key                    = "remote-state-test"
    dynamodb_table         = "ayra-practice-table"
  }

}

provider "aws" {
  region = "us-east-1"
}