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