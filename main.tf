module "jenkins_ec2" {
  source = "./ec2"

  name_prefix        = var.name_prefix
  vpc_id             = module.vpc.vpc_id
  subnet_id          = module.vpc.public_subnet_ids[0]
  allowed_admin_cidr = var.allowed_admin_cidr
  instance_type      = var.instance_type
  key_name           = var.key_name
  tags               = var.tags
}

moved {
  from = aws_security_group.jenkins
  to   = module.jenkins_ec2.aws_security_group.jenkins
}

moved {
  from = aws_instance.jenkins
  to   = module.jenkins_ec2.aws_instance.jenkins
}
