variable "project_name" {
  description = "The name of the CodeBuild project"
  type        = string
}

variable "project_description" {
  description = "A description for the CodeBuild project"
  type        = string
}

variable "build_timeout" {
  description = "The build timeout in minutes"
  type        = number
}

variable "source_location" {
  description = "GitHub repository URL for source"
  type        = string
}

variable "buildspec_file" {
  description = "The path to the buildspec file"
  type        = string
}

variable "image" {
  description = "The build image"
  type        = string
}

variable "service_role" {
  description = "IAM role ARN for CodeBuild"
  type        = string
}

variable "artifact_bucket" {
  description = "S3 bucket to store build artifacts"
  type        = string
}
