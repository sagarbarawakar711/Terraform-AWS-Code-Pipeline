output "codepipeline_name" {
  description = "The name of the CodePipeline pipeline"
  value       = aws_codepipeline.codepipeline.name
}
