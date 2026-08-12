output "instance_id" {
  description = "ID of the web EC2 instance"
  value       = aws_instance.web.id
}

output "instance_public_ip" {
  description = "Public IP of the web EC2 instance"
  value       = aws_instance.web.public_ip
}

output "security_group_id" {
  description = "ID of the web security group"
  value       = aws_security_group.web.id
}