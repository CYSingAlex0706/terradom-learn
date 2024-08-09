resource "aws_instance" "Public_access" {
  ami                    = "ami-0ae8f15ae66fe8cda"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.test_sub.id
  vpc_security_group_ids = [aws_security_group.ec2.id]
  tags = {
    Name = "Public_access"
  }
}

resource "aws_instance" "Private_access" {
  ami           = "ami-0ae8f15ae66fe8cda"
  instance_type = "t3.micro"

  subnet_id              = aws_subnet.test_sub.id
  vpc_security_group_ids = [aws_security_group.ec2.id]

  tags = {
    Name = "Private_access"
  }
}
