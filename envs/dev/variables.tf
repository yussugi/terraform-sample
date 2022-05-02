variable "aws_region" {
  type        = string
  default     = "us-west-2"
  description = "region"
}

variable "aws_profile" {
  type        = string
  default     = "unisushi_terraform"
  description = "AWS CLI"
}
