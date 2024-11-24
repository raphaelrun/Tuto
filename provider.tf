provider "aws" {
  region     = "eu-west-3"
}

resource "aws_vpc" "main" {
  cidr_block = "172.31.0.0/16"
}
# Peut créer de nouveau le même CIDR