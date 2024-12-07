resource "aws_iam_policy" "amazon_ec2_container_registry_read_only_for_snyk" {
  name        = "AmazonEC2ContainerRegistryReadOnlyForSnyk"
  description = "Policy allowing Snyk to access ECR resources with read-only permissions"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "SnykAllowPull"
        Effect = "Allow"
        Action = [
          "ecr:GetLifecyclePolicyPreview",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:DescribeImages",
          "ecr:GetAuthorizationToken",
          "ecr:DescribeRepositories",
          "ecr:ListTagsForResource",
          "ecr:ListImages",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetRepositoryPolicy",
          "ecr:GetLifecyclePolicy"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role" "snyk_service_role" {
  name        = "SnykServiceRole"
  description = "Allows EC2 instances to call Snyk AWS services on your behalf"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::198361731867:user/ecr-integration-user"
        }
        Action = "sts:AssumeRole"
        Condition = {
          StringEquals = {
            "sts:ExternalId" = "984af8a9-c717-426a-bdb0-7742e01e6deb"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "snyk_policy_attachment" {
  role       = aws_iam_role.snyk_service_role.name
  policy_arn = aws_iam_policy.amazon_ec2_container_registry_read_only_for_snyk.arn
}
