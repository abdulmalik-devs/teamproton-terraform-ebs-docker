output "bucket_id" {
    value = aws_s3_bucket.web_app_bucket.id
}  

output "frontend_file_name" {
  value = aws_s3_bucket_object.web_app_zips.key
}
output "admin_file_name" {
  value = aws_s3_bucket_object.web_app_zips.key
}
output "backend_file_name" {
  value = aws_s3_bucket_object.web_app_zips.key
}