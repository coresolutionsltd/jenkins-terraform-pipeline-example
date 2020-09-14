data "aws_ami" "al2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*.0-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]
}

data "aws_vpc" "core" {
  filter {
    name   = "tag:Name"
    values = ["Core"]
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = data.aws_vpc.core.id

  filter {
    name   = "tag:Name"
    values = ["Public-*"]
  }
}


data "template_file" "user_data" {
  template = file("user_data.tpl")
  vars = {
    colour = terraform.workspace
  }
}
