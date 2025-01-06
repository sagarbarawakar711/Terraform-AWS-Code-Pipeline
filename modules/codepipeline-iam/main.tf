resource "aws_iam_role" "codepipeline_role" {
  name = "codepipeline-iam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "codepipeline_policy" {
  name        = "codepipeline-policy"
  description = "CodePipeline permissions policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = [
          "codebuild:StartBuild",
          "codebuild:BatchGetBuilds"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:s3:::my-terraform-state-bucket-test-sagar*"  # Define your S3 bucket here
      },
      {
        Action   = "iam:PassRole"
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "codepipeline_policy_attachment" {
  role       = aws_iam_role.codepipeline_role.name
  policy_arn = aws_iam_policy.codepipeline_policy.arn
}


resource "aws_iam_policy" "codepipeline_connection_policy" {
  name        = "CodePipelineConnectionPolicy"
  description = "Allow CodePipeline to use CodeStar Connections"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "codestar-connections:UseConnection"
        Effect   = "Allow"
        Resource = "arn:aws:codestar-connections:ca-central-1:461655781674:connection/7a055fb2-16ea-496e-9420-0da05f2a5716"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_codepipeline_connection_policy" {
  role       = aws_iam_role.codepipeline_role.name
  policy_arn = aws_iam_policy.codepipeline_connection_policy.arn
}
