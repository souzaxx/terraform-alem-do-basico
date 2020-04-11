provider "aws" {
  region = "us-east-2"
  profile = "awsouza"
}

resource "aws_security_group" "sem-dynamic-block" {
  name        = "ficaemcasa-sg"
  description = "SG de teste, sem dynamic-block"

  ingress {
    description = "Inbound para SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["127.0.0.1/32"]
  }

  ingress {
    description = "Inbound para HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["127.0.0.1/32"]
  }

  ingress {
    description = "Inbound para HTTPs"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["127.0.0.1/32"]
  }

  ingress {
    description = "Inbound para postgres"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["127.0.0.1/32"]
  }

  tags = {
    Name = "ficaemcasa"
  }
}
