output "app-name" {
  value = module.EBS.ebs-app-name
}

output "s3_bucket_id" {
  value = module.s3.bucket_id
}

output "front-key" {
  value = module.s3.frontend_file_name
}

output "admin-key" {
  value = module.s3.admin_file_name
}

output "back-key" {
  value = module.s3.backend_file_name
}

output "ebs-front-name" {
  value = module.EBS.frontend_name
}

output "ebs-admin-name" {
  value = module.EBS.admin_name
}

output "ebs-back-name" {
  value = module.EBS.backend_name
}

output "ebs-front-version_label" {
  value = module.EBS.frontend_version_label
}

output "ebs-admin-version_label" {
  value = module.EBS.admin_version_label
}

output "ebs-back-version_label" {
  value = module.EBS.backend_version_label
}

output "database-endpoint" {
  value = module.database.rds_endpoint
}