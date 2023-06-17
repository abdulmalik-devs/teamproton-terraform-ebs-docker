output "iam_role_id" {
  value = aws_iam_role.webapp_role.name
}

output "instance_profile" {
  value = aws_iam_instance_profile.webapp_instance_profile.name  
}