module "souzaec2-dev" {
  source = "./modules/ec2"
  environment = "dev"

  providers = {
    aws = aws.dev
  }
}

module "souzaec2-hom" {
  source = "./modules/ec2"
  environment = "hom"

  providers = {
    aws = aws.hom
  }
}

module "souzaec2-prod" {
  source = "./modules/ec2"
  environment = "prod"

  providers = {
    aws = aws.prod
  }
}
