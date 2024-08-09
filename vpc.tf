resource "aws_vpc" "VPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_subnet" "test_sub" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "test"
  }
}

resource "aws_security_group" "ec2" {
  name        = "ec2"
  description = "Allow inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.VPC.id

  tags = {
    Name = "test"
  }
}

resource "aws_security_group_rule" "ingress_rule" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.VPC.cidr_block]
  security_group_id = aws_security_group.ec2.id
}

resource "aws_security_group_rule" "egress_rule" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.VPC.cidr_block]
  security_group_id = aws_security_group.ec2.id
}
