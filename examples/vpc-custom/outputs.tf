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

