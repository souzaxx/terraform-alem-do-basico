provider "aws" {
  region = "us-east-2"
  alias  = "dev"
  profile = "awsouza"
}

provider "aws" {
  region = "us-east-1"
  alias  = "hom"
  profile = "awsouza"
}

provider "aws" {
  region = "sa-east-1"
  alias = "prod"
  profile = "awsouza"
}
