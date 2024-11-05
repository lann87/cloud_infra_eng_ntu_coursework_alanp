# VPC /w 3pub 3pvt igw & EC2 modules
provider "aws" {
  region  = "us-east-1"
}

# VPC module
module "main_vpc" {
  source                  = "./modules/vpc"
  vpc_cidr                = "10.0.0.0/16"
  public_subnet_1a_cidr   = "10.0.1.0/24"
  public_subnet_1b_cidr   = "10.0.2.0/24"
  public_subnet_1c_cidr   = "10.0.3.0/24"
  private_subnet_1a_cidr  = "10.0.4.0/24"
  private_subnet_1b_cidr  = "10.0.5.0/24"
  private_subnet_1c_cidr  = "10.0.6.0/24"
}

# EC2 Module
module "main_ec2" {
  source              = "./modules/ec2"
  subnet_id           = module.main_vpc.public_subnet_1a_id
  key_name            = "alanp-useast1.pem"
  security_group_id   = aws_security_group.sg_http_ssh.id
}

# ALB Module
module "alb" {
  source              = "./modules/alb"
  vpc_id              = module.vpc.main_vpc.vpc_id
  public_subnets      = [module.vpc.public_subnet_1a_id, module.vpc.public_subnet_1b_id, module.vpc.public_subnet_1c_id]
  security_group_id   = aws_security_group.sg_http_ssh.id
  svr_instance_id     = module.main_ec2.instance_id
}

