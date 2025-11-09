aws_profile = "your-iam-user-profile"
security_group_ids = ["sg-xxxxxxxxx"]  # 보안 그룹 ID 목록 (필수)

# VPC 설정 (선택사항 - 기본값 사용 시 생략 가능)
# vpc_name = "example-vpc-ec2-graviton"
# vpc_cidr = "10.0.0.0/16"
# private_subnets = [
#   { cidr = "10.0.1.0/24", az = "ap-northeast-2a" },
#   { cidr = "10.0.2.0/24", az = "ap-northeast-2b" }
# ]

# EC2 설정 (선택사항 - 기본값 사용 시 생략 가능)
# instance_name = "example-ec2-graviton-instance"
# instance_type = "t4g.micro"
# architecture = "arm64"
# team = "backend"
# iam_instance_profile_name = "your-iam-profile-name"  # 선택사항
# root_volume_size = 30

# 태그 설정 (선택사항)
# tags = {
#   Environment = "example"
#   Project     = "tving-assignment"
# }

