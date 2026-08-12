output "vpc_id" {
  description = "ID of the Project 3 VPC"
  value       = module.network.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.network.public_subnet_id
}

output "security_group_id" {
  description = "ID of the web security group"
  value       = module.compute.security_group_id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = module.network.internet_gateway_id
}

output "route_table_id" {
  description = "ID of the public route table"
  value       = module.network.route_table_id
}

output "instance_id" {
  description = "ID of the web EC2 instance"
  value       = module.compute.instance_id
}

output "instance_public_ip" {
  description = "Public IP of the web EC2 instance"
  value       = module.compute.instance_public_ip
}