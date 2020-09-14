resource "aws_security_group" "instance" {
  name        = "${title(terraform.workspace)}-Instance-SG"
  description = "Allow public traffic on 80 & 443"
  vpc_id      = data.aws_vpc.core.id

  tags = {
    Name   = "${title(terraform.workspace)}-Instance-SG"
    Colour = title(terraform.workspace)
  }
}

resource "aws_security_group_rule" "http" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.instance.id
}

resource "aws_security_group_rule" "https" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.instance.id
}

resource "aws_security_group_rule" "allow_all" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.instance.id
}
