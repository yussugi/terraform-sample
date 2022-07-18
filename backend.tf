terraform {
  backend "s3" {
    bucket = "unisushi-oregon-tfstate"
    key    = "all-state/terraform.tfstate"
    region = "us-west-2"
    // profile        = "unisushi_terraform"
    dynamodb_table = "TerraformStateLockTable"
  }
}
