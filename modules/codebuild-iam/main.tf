resource "aws_iam_role" "codebuild_role" {
  name = "codebuild-iam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "codebuild.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "codebuild_policy" {
  name        = "codebuild-policy"
  description = "CodeBuild permissions policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:s3:::my-terraform-state-bucket-test-sagar/*"  # Define your S3 bucket here
      },
      {
        Action   = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = "codebuild:BatchGetBuilds"
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "codebuild_policy_attachment" {
  role       = aws_iam_role.codebuild_role.name
  policy_arn = aws_iam_policy.codebuild_policy.arn
}

resource "aws_iam_role_policy_attachment" "codebuild_cloudwatch_logs_full_access" {
  role       = "codebuild-iam-role"  # Replace with your actual role name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}

resource "aws_iam_role_policy_attachment" "codebuild_ecr_full_access" {
  role       = "codebuild-iam-role"  # Replace with your actual role name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_role_policy_attachment" "codebuild_secrets_manager_readwrite" {
  role       = "codebuild-iam-role"  # Replace with your actual IAM role name
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

