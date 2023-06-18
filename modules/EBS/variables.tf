variable "ebs_app_name" {}

variable "ebs_frontend_env_name" {}
variable "ebs_frontend_vpc_id" {}
variable "frontend_public_subnet_id" {}
variable "frontend_instance_profile_name" {}
variable "frontend_instance_profile_name_default" {}
variable "frontend_sg" {}
variable "frontend_bucket" {}

variable "frontend_key" {}

variable "ebs_admin_env_name" {}
variable "ebs_admin_vpc_id" {}
variable "admin_public_subnet_id" {}
variable "admin_instance_profile_name" {}
variable "admin_sg" {}
variable "admin_bucket" {}
variable "admin_key" {}

variable "ebs_backend_env_name" {}
variable "ebs_backend_vpc_id" {}
variable "backend_private_subnet_id" {}
variable "backend_instance_profile_name" {}
variable "backend_sg" {}
variable "backend_bucket" {}
variable "backend_key" {}
variable "database_endpoint" {}

# variable "environment_versions" {
#   type = list(object({
#     name        = string
#     application = string
#     description = string
#     bucket      = string
#     key         = string
#   }))
#   default = [
#     {
#       name        = "frontend-application-version"
#       application = aws_elastic_beanstalk_application.webapp_deploy.name
#       description = "Frontend Application Version"
#       bucket      = var.frontend_bucket
#       key         = var.frontend_key
#     },
#     {
#       name        = "admin-application-version"
#       application = aws_elastic_beanstalk_application.webapp_deploy.name
#       description = "Admin Application Version"
#       bucket      = var.admin_bucket
#       key         = var.admin_key
#     },
#     {
#       name        = "backend-application-version"
#       application = aws_elastic_beanstalk_application.webapp_deploy.name
#       description = "Backend Application Version"
#       bucket      = var.backend_bucket
#       key         = var.backend_key
#     }
#   ]
# }
