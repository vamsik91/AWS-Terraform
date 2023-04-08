resource "aws_network_acl" "Example-nacl" {
  vpc_id = aws_vpc.Example.id
  tags = {
    Name = "Example-nacl"
  }
}

resource "aws_network_acl_rule" "Example-nacl-Inbound" {
  network_acl_id = aws_network_acl.Example-nacl.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 65335
}

resource "aws_network_acl_rule" "Example-nacl-SSH" {
  network_acl_id = aws_network_acl.Example-nacl.id
  rule_number    = 100
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "Example-nacl-Http" {
  network_acl_id = aws_network_acl.Example-nacl.id
  rule_number    = 200
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_association" "Example-acl-asso" {
  network_acl_id = aws_network_acl.Example-nacl.id
  subnet_id      = aws_subnet.Example_subnet.id
}