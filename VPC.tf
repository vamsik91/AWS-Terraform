resource "aws_vpc" "Example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Example"
  }
}
resource "aws_subnet" "Example_subnet" {
  vpc_id                  = aws_vpc.Example.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Example_subnet"
  }
}

resource "aws_internet_gateway" "Example-Igw" {
  vpc_id = aws_vpc.Example.id

  tags = {
    Name = "Example-Igw"
  }
}