variable "pipeline_name" {
  description = "The name of the CodePipeline pipeline"
  type        = string
}

variable "service_role" {
  description = "IAM role ARN for CodePipeline"
  type        = string
}

variable "artifact_bucket" {
  description = "S3 bucket to store pipeline artifacts"
  type        = string
}

variable "github_owner" {
  description = "GitHub username"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}

variable "github_branch" {
  description = "GitHub branch to watch"
  type        = string
}

variable "github_oauth_token" {
  description = "OAuth token for GitHub"
  type        = string
}

variable "codebuild_project_name" {
  description = "Name of the CodeBuild project"
  type        = string
}

variable "github_connection_arn" {
  description = "The ARN of the GitHub connection (AWS CodeStar)"
  type        = string
}