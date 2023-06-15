terraform {
    required_providers {
       aws = {
         source = "hashicorp/aws"
       }
    }
}

# spin up provider
provider "aws" {
    region = "ca-central-1"
    shared_config_files = ["$HOME/.aws/config"]
    shared_credentials_files = [ "$HOME/.aws/credentials" ]
    profile = "cohart-project"
}


# 
resource "aws_s3_bucket" "raw_1" {
  bucket = "raw-bucket-bravemedia"
}

resource "aws_s3_bucket" "raw_2" {
  bucket = "processed-bucket-bravemedia"
}


resource "aws_db_instance" "myinstance" {
  engine               = "POSTGRES"
  identifier           = "brave-media-dw"
  allocated_storage    =  20
  engine_version       = "14.7"
  instance_class       = "db.t3.micro"
  username             = "goodgoodstudy"
  password             = "daydayup"
}