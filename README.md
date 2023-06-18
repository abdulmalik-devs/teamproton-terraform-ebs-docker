# AWS Infrastructure with Terraform and Github Actions

This repository contains the Terraform configuration and Github Actions workflow to deploy an Micro-service web application with RDS on AWS .

## Architecture
![architecture](https://github.com/abdulmalik-devs/teamproton-terraform-ebs-docker/assets/62616273/ee4f5306-38bf-4278-8ea1-5e9c749877da)

## Steps to recreate the project

1. Manually build and push images to ECR.
2. Add the ECR name and URI to container task definition (Dockercontainer task configiration).
3. Upload the container configuration file (Docker.aws.json) to the S3 object.
4. Modify Terraform configuration to provision S3, ECR, Elastic Beanstalk environment and RDS.
5. Deploy the Github Actions workflow.

## Details

### Manually build and push image to ECR

1. Create a Dockerfile.
2. Build the Docker image.
3. Push the Docker image to ECR.

### Add the ECR name and URI to container task definition

1. Open the container task definition file (Dockercontainer task configiration).
2. Add the ECR name and URI to the `Image` property.
3. Save the file.

### Upload the container configuration file to the S3 object

1. Upload the container configuration file (Docker.aws.json) to the S3 object.

### Run Terraform to provision S3, ECR, Elastic Beanstalk environment and RDS

1. Install Terraform.
2. Initialize Terraform.

```shell
terraform init
``` 

3. Plan the Terraform configuration.

```shell
terraform plan
```

4. Apply the Terraform configuration.

```shell
terraform apply 
```

### Deploy the Github Actions workflow

1. Create a Github Actions workflow file (.github/workflows/main.yml).
2. Configure the Github Actions workflow.
3. Push the Github Actions workflow file to the repository.

## Subnets

The frontend and admin will be in public subnet while backend and rds will be in private subnet.

There are general steps that you must follow in order to launch the infrastructure resources.

Before launching the solution please follow the next steps:

Install Terraform, use Terraform v0.13 or above. You can visit this Terraform official webpage to download it.
Configure the AWS credentials into your machine (~/.aws/credentials). You need to use the following format:
```shell
aws configure
```
    
```shell
    [AWS_PROFILE_NAME]
    aws_access_key_id = Replace_with_the_correct_access_Key
    aws_secret_access_key = Replace_with_the_correct_secret_Key
```

 Run Checkov to analyze the infrastructure code and identify any misconfigurations or security vulnerabilities:

   ```shell
   checkov -d application/
   ```

   ```shell
   checkov -d modules/
   ```

   Review the Checkov report and address any identified issues before proceeding with the deployment.

## References

* [Terraform documentation](https://www.terraform.io/docs/)
* [Github Actions documentation](https://docs.github.com/en/actions)
* [Checkov](https://github.com/bridgecrewio/checkov) - Open-source IaC static code analysis tool.
* [AWS ECS Documentation](https://docs.aws.amazon.com/ecs)
* [Docker Documentation](https://docs.docker.com)

## Author

[AbduMalik Ololade](https://github.com/abdulmalik-devs)
[Ibraheem](https://github.com/eabrahym75)
[Naseer](https://github.com/Nahsc0)


## Date

2023-06-17
