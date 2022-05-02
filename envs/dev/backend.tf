terraform {
  backend "S3" {
    bucket         = "unisushi-oregon-tfstate"
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "TerraformLockState"
  }
}
