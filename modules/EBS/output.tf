output "ebs-app-name" {
  value = aws_elastic_beanstalk_application.webapp_deploy.name
}

output "frontend_name" {
  value = aws_elastic_beanstalk_environment.frontend.name
}

output "admin_name" {
  value = aws_elastic_beanstalk_environment.admin.name
}

output "backend_name" {
  value = aws_elastic_beanstalk_environment.backend.name
}

output "frontend_version_label" {
  value = aws_elastic_beanstalk_application_version.frontend_version.name
}

output "admin_version_label" {
  value = aws_elastic_beanstalk_application_version.admin_version.name
}

output "backend_version_label" {
  value = aws_elastic_beanstalk_application_version.backend_version.name
}