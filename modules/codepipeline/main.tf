resource "aws_codepipeline" "codepipeline" {
  name     = var.pipeline_name
  role_arn = var.service_role

  artifact_store {
    location = var.artifact_bucket
    type     = "S3"
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = aws_codestarconnections_connection.example.arn
        FullRepositoryId = "sagarbarawakar711/Docker-Image-Test"
        BranchName       = "main"
      }
    }
  }




  stage {
  name = "Build"
  action {
    name             = "Build"
    category         = "Build"
    owner            = "AWS"
    provider         = "CodeBuild"
    version          = "1"  # This is the required attribute
    input_artifacts  = ["source_output"]
    output_artifacts = ["build_output"]

    configuration = {
      "ProjectName" = var.codebuild_project_name
    }
  }
}
}


resource "aws_codestarconnections_connection" "example" {
  name          = "example-connection"
  provider_type = "GitHub"
}
