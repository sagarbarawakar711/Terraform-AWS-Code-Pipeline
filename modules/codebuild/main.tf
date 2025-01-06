resource "aws_codebuild_project" "codebuild_project" {
  name          = var.project_name
  description   = var.project_description
  build_timeout = var.build_timeout

  source {
    type      = "GITHUB"
    location  = var.source_location
    buildspec = var.buildspec_file
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = var.image
    type         = "LINUX_CONTAINER"
  }

  service_role = var.service_role

  artifacts {
    type     = "S3"
    location = var.artifact_bucket
  }
}
