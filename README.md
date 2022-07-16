# terraform-sample

## What is this?

This project, create web application infrastructure on AWS. Using IAM, S3, VPC, DNS, ECS, etc...

## Resouces
- IAM
- S3
- VPC, NAT-GW, Security Group
- ALB, Route53, ACM
- ECS, Fargate
- ECS Scheduled Tasks
- KMS
- SSM Parameter Store
- RDS ElastiCache
- ECR, CodeBuild, CodePipeline
- EC2, Session Manager
- CloudWatch Logs, Kinesis Data Firehose

## NOTICE

Setting backend.tf file (S3 bucket name, DynamoDB, AWS profile)
Next, setting provider.tf file (AWS profile)
This project is using variables.tf (aws_profile)

### Execute the following command
`terraform init -reconfigure`


### Add module, using the following command
`terraform init`