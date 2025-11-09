output "vpc_id" {
  description = "생성된 VPC의 ID"
  value       = module.vpc.vpc_id
}

output "ec2_instance_id" {
  description = "생성된 EC2 인스턴스 ID"
  value       = module.ec2.instance_id
}

output "ec2_private_ip" {
  description = "EC2 인스턴스 프라이빗 IP"
  value       = module.ec2.instance_private_ip
}

