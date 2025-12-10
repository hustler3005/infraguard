terraform {

  required_providers {

    aws = {

      source  = "hashicorp/aws"

      version = "~> 5.0"

    }

  }

}



provider "aws" {

  region = "us-east-1"

}



# Intentionally insecure S3 bucket

resource "aws_s3_bucket" "public_bucket" {

  bucket = "infraguard-demo-bucket-12345"

}



resource "aws_s3_bucket_public_access_block" "public_access" {

  bucket = aws_s3_bucket.public_bucket.id



  block_public_acls       = false

  block_public_policy     = false

  ignore_public_acls      = false

  restrict_public_buckets = false

}


