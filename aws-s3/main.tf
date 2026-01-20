terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "demo-bucket-${random_id.bucket_id.hex}"

  tags = {
    Name = "Demo Bucket"
  }
}


resource "aws_s3_object" "bucket_data" {
  bucket = aws_s3_bucket.demo_bucket.bucket
  key    = "mydata.txt"
  source = "${path.module}/myfile.txt"
}
