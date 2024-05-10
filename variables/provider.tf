terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
}

#Provide Authentication here
provider "aws" {
    region = "us-east-1"
  # Don't keep both keys here (If we push into github Our AWS Account will be hacked)
  
}