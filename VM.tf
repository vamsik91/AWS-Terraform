resource "aws_instance" "Example-server" {
  ami                    = "ami-0abc4c35ba4c005ca"
  instance_type          = "t2.micro"
  key_name               = "key"
  subnet_id              = aws_subnet.Example_subnet.id
  vpc_security_group_ids = [aws_security_group.Example-sg.id]
  user_data              = file("web.sh")
  tags = {
    Name = "Example-Server"
  }

}