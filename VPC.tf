resource "aws_vpc" "Example" {
  cidr_block       = "10.0.0.0/16"
  
  tags = {
    Name = "Example"
  }
}