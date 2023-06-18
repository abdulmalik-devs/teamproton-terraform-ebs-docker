module "vpc" {
  source = "./modules/VPC"

  vpc_name = "teamproton_vpc"
}

module "sg" {
  source = "./modules/Security_Group"

  frontend_sg_name  = "frontend-security-group"
  frontend_vpc_id   = module.vpc.vpc-id

  admin_sg_name    = "admin-security-group"
  admin_vpc_id      = module.vpc.vpc-id

  backend_sg_name   = "backend-security-group"
  backend_vpc_id    = module.vpc.vpc-id
  
}

module "s3" {
  source = "./modules/S3"

  bucket_name = "teamproton"
}

module "IAM_ROLE" {
  source = "./modules/IAM"

  iam_role_name = "teamproton_iam"
}
module "EBS" {
  source                                = "./modules/EBS"

  ebs_app_name                          = "teamproton_ebs"
  
  ebs_frontend_env_name                 = "frontend-environment"
  ebs_frontend_vpc_id                   = module.vpc.vpc-id
  frontend_public_subnet_id             = module.vpc.public_subnet_id
  frontend_instance_profile_name        = module.IAM_ROLE.instance_profile
  frontend_instance_profile_name_default= module.IAM_ROLE.instance_profile
  frontend_sg                           = module.sg.frontend_sg_id
  frontend_bucket                       = module.s3.bucket_id
  frontend_key                          = module.s3.frontend_file_name
  
  ebs_admin_env_name                    = "admin-environment"
  ebs_admin_vpc_id                      = module.vpc.vpc-id
  admin_public_subnet_id                = module.vpc.public_subnet_id
  admin_instance_profile_name           = module.IAM_ROLE.instance_profile
  admin_sg                              = module.sg.admin_sg_id
  admin_bucket                          = module.s3.bucket_id
  admin_key                             = module.s3.admin_file_name
  
  ebs_backend_env_name                  = "backend-environment"
  ebs_backend_vpc_id                    = module.vpc.vpc-id
  backend_private_subnet_id             = module.vpc.private_subnet_id
  backend_instance_profile_name         = module.IAM_ROLE.instance_profile
  backend_sg                            = module.sg.backend_sg_id
  backend_bucket                        = module.s3.bucket_id
  backend_key                           = module.s3.backend_file_name
  database_endpoint                     = module.database.rds_endpoint

}
module "database" {
  source = "./modules/Database"

  db_name     = "teamproton_db"
  db_username = "teamproton_user"

}
