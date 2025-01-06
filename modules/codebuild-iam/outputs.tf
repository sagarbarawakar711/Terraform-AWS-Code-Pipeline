output "codebuild_role_arn" {
  description = "The ARN of the CodeBuild IAM Role"
  value       = aws_iam_role.codebuild_role.arn
}
