output "instance_id" {
  description = "ID of the Jenkins EC2 instance."
  value       = aws_instance.jenkins.id
}

output "public_ip" {
  description = "Public IPv4 address of the Jenkins instance."
  value       = aws_instance.jenkins.public_ip
}

output "url" {
  description = "Jenkins web UI URL, reachable from the allowed admin CIDR."
  value       = "http://${aws_instance.jenkins.public_ip}:8080"
}

output "initial_admin_password_command" {
  description = "Command to read the Jenkins setup password over SSH."
  value       = "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
}
