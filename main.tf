terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "terraform-project3-state-959666773482"
    key    = "project3/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./modules/network"

  environment       = var.environment
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
  vpc_cidr          = var.vpc_cidr
}

module "compute" {
  source = "./modules/compute"

  environment   = var.environment
  ami_id        = var.ami_id
  instance_type = var.instance_type

  vpc_id    = module.network.vpc_id
  subnet_id = module.network.public_subnet_id
}