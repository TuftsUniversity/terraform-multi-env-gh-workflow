terraform {
  backend "s3" {
    bucket         = "data-team-k0a0f2zjx1qcot-state-bucket"
    key            = "data-team-infrastructure-multi-env"
    region         = "us-east-1"
    encrypt        = true
    role_arn       = "arn:aws:iam::888587572715:role/data-team-k0a0f2zjx1qcot-tf-assume-role"
    dynamodb_table = "data-team-k0a0f2zjx1qcot-state-lock"
  }
  required_version = ">= 0.15"
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

variable "region" {
  description = "AWS Region"
  type        = string
}

provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  owners = ["099720109477"]
}

resource "aws_instance" "instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    Name = "hello-new-instance"
  }
}
