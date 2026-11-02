output "jenkins_instance_id" {
  description = "ID of the Jenkins EC2 instance."
  value       = module.jenkins_ec2.instance_id
}

output "jenkins_public_ip" {
  description = "Public IPv4 address of the Jenkins instance."
  value       = module.jenkins_ec2.public_ip
}

output "jenkins_url" {
  description = "Jenkins web UI URL. Accessible only from allowed_admin_cidr."
  value       = module.jenkins_ec2.url
}

output "jenkins_initial_admin_password_command" {
  description = "Run this command over SSH on the instance to read the Jenkins setup password."
  value       = module.jenkins_ec2.initial_admin_password_command
}
