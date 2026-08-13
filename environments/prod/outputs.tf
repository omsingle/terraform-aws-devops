output "vpc_id" {
  description = "ID of the PROD VPC"
  value       = module.network.vpc_id
}

output "public_subnet_id" {
  description = "ID of the PROD public subnet"
  value       = module.network.public_subnet_id
}

output "security_group_id" {
  description = "ID of the PROD security group"
  value       = module.compute.security_group_id
}

output "instance_id" {
  description = "ID of the PROD EC2 instance"
  value       = module.compute.instance_id
}

output "instance_public_ip" {
  description = "Public IP of the PROD EC2 instance"
  value       = module.compute.instance_public_ip
}