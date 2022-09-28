provider "aws" {
	region = "us-west-2"
}

module "VPC" {
	source	= "../../modules/VPC"
	vpc-cidr	= var.vpc-cidr
	pubsubcidr	= var.pubsubcidr
}

module "securitygroups" {
	source		= "../../modules/securitygroups"
	vpc_id		= module.VPC.vpc_id
	my_public_ip      = var.my_public_ip
	depends_on 		= [module.VPC]
}

module "EC2" {
	source		= "../../modules/EC2"
	subnet_id 		= module.VPC.subnet_id
	airflow_sg_id	= module.securitygroups.airflow_sg_id
	depends_on 		= [module.securitygroups]
}
