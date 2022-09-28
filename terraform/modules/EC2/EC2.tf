module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-017fecd1353bcc96e"
  instance_type          = "t2.medium"
  availability_zone 	 = "us-west-2c"
  key_name               = "airflow"
  monitoring             = true
  vpc_security_group_ids = ["${var.airflow_sg_id}"]
  subnet_id              = var.subnet_id

  tags = {
    Terraform   = "true"
    Environment = "test"
  }
}


