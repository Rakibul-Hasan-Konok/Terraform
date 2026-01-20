terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-1"
}

# Create a VPC
resource "aws_instance" "example" {
  ami="ami-00d8fc944fb171e29"
  instance_type = "t3.micro"
  tags = {
    Name="SampleServer"
  }
}