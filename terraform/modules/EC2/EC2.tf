resource "aws_instance" "airflow-instance" {

  ami                    = "ami-017fecd1353bcc96e"
  instance_type          = "t2.medium"
  availability_zone 	 = "us-west-2c"
  key_name               = var.key_name
  monitoring             = true
  vpc_security_group_ids = ["${var.airflow_sg_id}"]
  subnet_id              = var.subnet_id
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = "test"
  }
}


