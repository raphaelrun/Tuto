provider "aws" {
  region     = "eu-west-3"
}

resource "aws_vpc" "main" {
  cidr_block = "172.31.0.0/16"
}
#Voir si cela ne crée pas un autre cidr_Block