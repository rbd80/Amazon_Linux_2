terraform {
  required_version = ">= 0.9.3"
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
    github_oauth_token  = ""
    repo_owner          = "GSA-Briar-Patch"
    repo_name           = "Amazon_Linux_2"
    branch              = "master"

    # http://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref.html
    # http://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html
    build_image         = "aws/codebuild/docker:1.12.1"
    build_compute_type  = "BUILD_GENERAL1_SMALL"

    # These attributes are optional, used as ENV variables when building Docker images and pushing them to ECR
    # For more info:
    # http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html
    # https://www.terraform.io/docs/providers/aws/r/codebuild_project.html
    privileged_mode     = "true"
    aws_region          = "us-east-1"
    #aws_account_id      = "xxxxxxxxxx"
    #image_repo_name     = "ecr-repo-name"
    image_tag           = "latest"
}