resource "aws_instance" "web" {
  ami           = "ami-01eb696891a3b3bcf"
  instance_type = "t2.micro"
  count = 5

  tags = {
    Name = "HelloWorld"
  }
}

#Security Group

resource "aws_security_group" "TF_SG" {
  name        = "TF_SG"
  description = "TF_SG inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "TF_SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "TF_SG_ipV4_443" {
  security_group_id = aws_security_group.TF_SG.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "TF_SG_ipV4_22" {
  security_group_id = aws_security_group.TF_SG.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


resource "aws_vpc_security_group_ingress_rule" "TF_SG_ipV4_80" {
  security_group_id = aws_security_group.TF_SG.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.TF_SG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
