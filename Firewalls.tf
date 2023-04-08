
#NACL
resource "aws_network_acl" "Example-nacl" {
  vpc_id = aws_vpc.Example.id
  tags = {
    Name = "Example-nacl"
  }
}


#NACL Inbound Rules
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

#NACL Outbound Rules
resource "aws_network_acl_rule" "Example-nacl-outbound" {
  network_acl_id = aws_network_acl.Example-nacl.id
  rule_number    = 100
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 65335
}


#NACL Subnet Association
resource "aws_network_acl_association" "Example-acl-asso" {
  network_acl_id = aws_network_acl.Example-nacl.id
  subnet_id      = aws_subnet.Example_subnet.id
}

#Adding Security groups

resource "aws_security_group" "Example-sg" {
  name   = "Example-sg"
  vpc_id = aws_vpc.Example.id

  tags = {
    Name = "Example-sg"
  }


}

#Adding Security rules

resource "aws_security_group_rule" "Example-ssh-rule" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.Example-sg.id
}

resource "aws_security_group_rule" "Example-http-rule" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.Example-sg.id
}

resource "aws_security_group_rule" "Example-outbound-rule" {
  type        = "egress"
  from_port   = 0
  to_port     = 65335
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.Example-sg.id
}