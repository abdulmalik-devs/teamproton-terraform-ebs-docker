# Create a S3 Bucket
resource "aws_s3_bucket" "web_app_bucket" {
  bucket = var.bucket_name
  tags = {
    Name        = "Application Bucket"
    Environment = "Dev"
  }
}


# Create a S3 Bucket Object
resource "aws_s3_bucket_object" "web_app_zips" {
  bucket = aws_s3_bucket.web_app_bucket.bucket
  key    = "Dockerrun.aws.json"
  source = "Dockerrun.aws.json"
}