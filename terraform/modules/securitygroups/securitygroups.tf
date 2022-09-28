resource "aws_security_group" "airflow-sg" {
 name 			= "sparkify-airflow"

 revoke_rules_on_delete = true
 vpc_id    			= var.vpc_id

 egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

 ingress {
    protocol = "tcp"
    from_port = 0
    to_port = 22
    cidr_blocks = ["${var.my_public_ip}/32"]
  }
}
