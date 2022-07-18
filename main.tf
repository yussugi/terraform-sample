// Create VPC
module "example" {
  source = "./modules/vpc"
  name   = "simple-example"
}

// security group (call module)
module "example_sg" {
  source      = "./modules/security_group"
  name        = "module-sg"
  vpc_id      = module.example.vpc_id
  port        = 80
  cidr_blocks = ["0.0.0.0/0"]
}
