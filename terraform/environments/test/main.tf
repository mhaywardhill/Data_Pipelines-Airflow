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
