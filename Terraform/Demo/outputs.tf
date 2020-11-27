output "sg_name" {
  value = aws_security_group.instance.name
}

output "sg_id" {
  value = aws_security_group.instance.id
}

output "vpc_id" {
  value = data.aws_vpc.core.id
}
