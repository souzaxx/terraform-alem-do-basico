provider "aws" {
  region = local.region
  profile = "awsouza"
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_security_group_ids = terraform.workspace == "dev" ? [data.terraform_remote_state.dev-default-sg[0].outputs.id] : []

  tags = {
    Name = "HelloWorld"
    Env  = terraform.workspace
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

locals {
  region = lookup(var.ambiente_regiao, terraform.workspace)
}

variable ambiente_regiao {
  type = map(string)
  default = {
    default = "us-east-2"
    dev = "us-east-2"
    hom = "us-east-1"
    prod = "sa-east-1"
  }
}

data "terraform_remote_state" "dev-default-sg" {
  count = terraform.workspace == "dev" ? 1 : 0
  backend = "s3"

  config = {
    bucket = "ficaemcasaconf-tfstate"
    key    = "sg/terraform.state"
    region = "us-east-2"
    profile = "awsouza"
  }
}
