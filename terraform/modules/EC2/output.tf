output airflow_ip_addr {
 	value = aws_instance.airflow-instance.public_ip
}
