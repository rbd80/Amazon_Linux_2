terraform {
  required_version = ">= 0.9.3"
}

provider "aws" {
  version = "~> 1.0"
  region     = "us-east-1"
}

data "aws_region" "current" {}

module "build" {
    source              = "git::https://github.com/cloudposse/terraform-aws-cicd.git?ref=master"
    namespace           = "global"
    name                = "test"
    stage               = "staging"

    # Enable the pipeline creation
    enabled             = "true"

    # Application repository on GitHub
    repo_owner          = "GSA-Briar-Patch"
    repo_name           = "Amazon_Linux_2"
    branch              = "master"

}