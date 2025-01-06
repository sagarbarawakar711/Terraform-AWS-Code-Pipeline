provider "aws" {
  region = "ca-central-1"  # Adjust to your region
}

module "codebuild-iam" {
  source        = "./modules/codebuild-iam"
}

module "codepipeline-iam" {
  source        = "./modules/codepipeline-iam"
}



# CodeBuild Project
module "codebuild_project" {
  source          = "./modules/codebuild"
  project_name    = "my-codebuild-project"
  project_description = "CodeBuild project for GitHub integration"
  build_timeout   = 60
  source_location = "https://github.com/sagarbarawakar711/Docker-Image-Test.git"  # Replace with your GitHub repo URL
  buildspec_file  = "buildspec.yml"  # Path to buildspec.yml in your GitHub repo
  image           = "aws/codebuild/standard:5.0"
  service_role    = module.codebuild-iam.codebuild_role_arn
  artifact_bucket = "my-terraform-state-bucket-test-sagar"  # S3 bucket to store build artifacts
}



# resource "aws_codestarconnections_connection" "example" {
#   name     = "my-github-connection"
#   provider = "github"
# }


# CodePipeline Configuration




module "codepipeline" {
  source                = "./modules/codepipeline"
  pipeline_name         = "my-codepipeline-pipeline"
  service_role          = module.codepipeline-iam.codepipeline_role_arn
  artifact_bucket       = "my-terraform-state-bucket-test-sagar"  
  github_owner          = "agarbarawakar711" 
  github_repo           = "Docker-Image-Test"      
  github_branch         = "main"           
  github_connection_arn = "arn:aws:codeconnections:ca-central-1:461655781674:connection/034ccaa0-c7fb-4923-b0a5-d07436538026"
  github_oauth_token  = "xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  codebuild_project_name = module.codebuild_project.codebuild_project_name
}

# Output the pipeline name
output "codepipeline_name" {
  value = module.codepipeline.codepipeline_name
}
