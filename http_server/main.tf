provider "aws" {
  region = "us-west-2"
}

// Amazon Linux2 latest data source from ssm
data "aws_ssm_parameter" "amzn2_latest" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-kernel-5.10-hvm-x86_64-gp2"
}

// Amazon Linux2 latest data source
data "aws_ami" "recent_amazon_linux2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.????????-x86_64-gp2"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

}

// 変数定義
variable "example_instance_type" {
  default = "t3.micro"
}

// local変数定義
locals {
  example_instance_type = "t3.micro"
}

variable "instance_type" {

}

resource "aws_instance" "default" {
  ami                    = data.aws_ami.recent_amazon_linux2.image_id
  vpc_security_group_ids = [aws_security_group.default.id]
  instance_type          = var.instance_type

  user_data = <<EOF
  #!/bin/bash
  yum install -y httpd
  systemctl start httpd.service
EOF
}

resource "aws_security_group" "default" {
  name = "ec2"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_dns" {
  value = aws_instance.default.public_dns
}