# Create an Elastic Beanstalk application
resource "aws_elastic_beanstalk_application" "webapp_deploy" {
  name        = var.ebs_app_name
  description = "My Node.js Application"
}

# Create an Elastic Beanstalk environment for Frontend App
resource "aws_elastic_beanstalk_environment" "frontend" {
  name                = var.ebs_frontend_env_name
  application         = aws_elastic_beanstalk_application.webapp_deploy.name
  version_label         = aws_elastic_beanstalk_application_version.frontend_version.name
  solution_stack_name = "64bit Amazon Linux 2 v3.2.8 running ECS"
  wait_for_ready_timeout = "15m"


  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.ebs_frontend_vpc_id
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = var.frontend_public_subnet_id
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = var.frontend_sg
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "BACKEND_API_URL"
    value     = aws_elastic_beanstalk_environment.backend.endpoint_url
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = var.frontend_instance_profile_name
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "LoadBalanced"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = "aws-elasticbeanstalk-service-role"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "HealthCheckPath"
    value     = "/health"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "Executor"
    value     = "node"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "Version"
    value     = "18"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "IamInstanceProfile"
    value     = var.frontend_instance_profile_name_default
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "InstanceType"
    value     = "t2.micro"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "RootObject"
    value     = "index.js"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "IgnoreHealthCheck"
    value     = "false"
  }

   setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "NODE_ENV"
    value     = "production"
  }
}


# Create an Elastic Beanstalk environment for Admin App
resource "aws_elastic_beanstalk_environment" "admin" {
  name                = var.ebs_admin_env_name
  application         = aws_elastic_beanstalk_application.webapp_deploy.name
  version_label         = aws_elastic_beanstalk_application_version.admin_version.name
  solution_stack_name = "64bit Amazon Linux 2 v3.2.8 running ECS"
  wait_for_ready_timeout = "15m"


  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.ebs_admin_vpc_id
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = var.admin_public_subnet_id
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = var.admin_sg
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "BACKEND_API_URL"
    value     = aws_elastic_beanstalk_environment.backend.endpoint_url
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = var.admin_instance_profile_name
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "LoadBalanced"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = "aws-elasticbeanstalk-service-role"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "HealthCheckPath"
    value     = "/health"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "Executor"
    value     = "node"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "Version"
    value     = "18"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "IamInstanceProfile"
    value     = var.admin_instance_profile_name_default
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "InstanceType"
    value     = "t2.micro"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "RootObject"
    value     = "index.js"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "IgnoreHealthCheck"
    value     = "false"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "NODE_ENV"
    value     = "production"
  }
}

# Create an Elastic Beanstalk environment for Backend App
resource "aws_elastic_beanstalk_environment" "backend" {
  name                = var.ebs_backend_env_name
  application         = aws_elastic_beanstalk_application.webapp_deploy.name
  version_label         = aws_elastic_beanstalk_application_version.backend_version.name
  solution_stack_name = "64bit Amazon Linux 2 v3.2.8 running ECS"
  wait_for_ready_timeout = "15m"

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.ebs_backend_vpc_id
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = var.backend_private_subnet_id
  }
  
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = var.backend_sg
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DATABASE_CONNECTION_STRING"
    value     = var.database_endpoint
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = var.backend_instance_profile_name
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "IamInstanceProfile"
    value     = var.backend_instance_profile_name_default
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "IgnoreHealthCheck"
    value     = "true"
  }
}

resource "aws_elastic_beanstalk_application_version" "frontend_version" {
  name        = "frontend-application-version"
  application = aws_elastic_beanstalk_application.webapp_deploy.name
  description = "Frontend Application Version"
  bucket      = var.frontend_bucket
  key         = var.frontend_key
}

resource "aws_elastic_beanstalk_application_version" "admin_version" {
  name        = "admin-application-version"
  application = aws_elastic_beanstalk_application.webapp_deploy.name
  description = "Admin Application Version"
  bucket      = var.admin_bucket
  key         = var.admin_key
}

resource "aws_elastic_beanstalk_application_version" "backend_version" {
  name        = "backend-application-version"
  application = aws_elastic_beanstalk_application.webapp_deploy.name
  description = "Backend Application Version"
  bucket      = var.backend_bucket
  key         = var.backend_key
}