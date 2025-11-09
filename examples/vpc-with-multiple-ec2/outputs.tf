output "vpc_id" {
  description = "생성된 VPC의 ID"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "VPC의 CIDR 블록"
  value       = module.vpc.vpc_cidr_block
}

output "private_subnet_ids" {
  description = "프라이빗 서브넷의 ID 목록"
  value       = module.vpc.private_subnet_ids
}

output "ec2_instance_ids" {
  description = "생성된 EC2 인스턴스 ID 맵"
  value       = { for k, v in module.ec2 : k => v.instance_id }
}

output "ec2_private_ips" {
  description = "EC2 인스턴스 프라이빗 IP 맵"
  value       = { for k, v in module.ec2 : k => v.instance_private_ip }
}

