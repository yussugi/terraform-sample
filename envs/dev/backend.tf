terraform {
    backend "S3" {
        bucket = "hogehoge"
        key = "hogehoge.tfstate"
        region = "ap-northeast-1"
        dynamodb_table = "TerraformLockState"
    }
}