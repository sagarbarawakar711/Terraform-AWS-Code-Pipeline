variable "aws_region" {
  description = "The AWS region to deploy to"
  default     = "ca-central-1"  
}



variable "region" {
  description = "AWS region"
  type        = string
  default     = "ca-central-1"
}

variable "pipeline_name" {
  description = "The name of the CodePipeline"
  type        = string
  default     = "my-codepipeline-pipeline"
}

variable "artifact_bucket" {
  description = "S3 bucket to store artifacts"
  type        = string
  default     = "my-terraform-state-bucket-test-sagar"
}

variable "github_owner" {
  description = "GitHub owner name"
  type        = string
  default     = "sagarbarawakar711"
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
  default     = "Docker-Image-Test"
}

variable "github_branch" {
  description = "GitHub branch"
  type        = string
  default     = "main"
}


variable "codebuild_project_name" {
  description = "CodeBuild project name"
  type        = string
  default     = "my-codebuild-project"
}

# Define input variables
variable "codepipeline_role_name" {
  description = "The name of the IAM role for CodePipeline"
  type        = string
  default     = "codepipeline-iam-role"
}

variable "github_connection_arn" {
  description = "The ARN of the GitHub connection"
  type        = string
}