module "aws_ubuntu_ami" {
  source = "./module/data_sources/aws_ami"
}

module "ec2_instance_web_access" {
  source = "./module/aws_ec2_instance"

  name = "Internet access instance"
  ami  = "ami-0b9094fa2b07038b8"

  key_name = var.key_name

  subnet_id              = module.subnet["Public-1a"].subnet_id
  vpc_security_group_ids = [module.web_access_sg.sg_id]

  user_data = file("${path.module}/user_data.sh")
}

module "ec2_instance_internal" {
  source = "./module/aws_ec2_instance"

  name = "Internal Instance"
  ami  = module.aws_ubuntu_ami.aws_ami_id

  key_name = var.key_name

  subnet_id              = module.subnet["Private-1b"].subnet_id
  vpc_security_group_ids = [module.web_access_sg.sg_id]
}
