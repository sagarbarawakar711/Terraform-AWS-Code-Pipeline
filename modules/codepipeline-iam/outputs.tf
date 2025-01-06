output "codepipeline_role_arn" {
  description = "The ARN of the CodePipeline IAM Role"
  value       = aws_iam_role.codepipeline_role.arn
}
