resource "aws_ecr_repository" "dotnet_app" {
  name                 = "dotnet-app-ecr-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
