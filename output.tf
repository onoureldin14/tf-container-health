output "snyk_service_role_arn" {
  description = "The ARN of the Snyk service role"
  value       = aws_iam_role.snyk_service_role.arn
}
