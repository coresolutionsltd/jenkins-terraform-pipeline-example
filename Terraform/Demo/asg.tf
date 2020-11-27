module "asg" {
  source  = "coresolutions-ltd/asg/aws"
  version = "1.0.6"

  name             = "${title(terraform.workspace)}-Demo"
  min_size         = 1
  max_size         = 1
  desired_capacity = 1

  vpc_zone_identifier = data.aws_subnet_ids.public.ids

  launch_template = {
    image_id       = data.aws_ami.al2.id
    instance_type  = "t3.nano"
    user_data      = base64encode(data.template_file.user_data.rendered)
    spot           = true
    spot_max_price = 0.02

    network_interface = {
      associate_public_ip_address = true
      security_groups             = [aws_security_group.instance.id]
    }
  }
}
