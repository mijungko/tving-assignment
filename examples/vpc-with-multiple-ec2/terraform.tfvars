aws_profile = "your-iam-user-profile"

# VPC 설정 (선택사항 - 기본값 사용 시 생략 가능)
# vpc_name = "example-vpc-multiple-ec2"
# vpc_cidr = "10.0.0.0/16"
# private_subnets = [
#   { cidr = "10.0.1.0/24", az = "ap-northeast-2a" },
#   { cidr = "10.0.2.0/24", az = "ap-northeast-2b" }
# ]

# EC2 인스턴스 설정 (3개 인스턴스 예시)
instances = {
  instance1 = {
    instance_name             = "example-ec2-instance-1"
    instance_type             = "t3.micro"
    architecture              = "x86_64"
    subnet_index              = 0  # 첫 번째 서브넷 사용
    security_group_ids        = ["sg-xxxxxxxxx"]
    team                      = "backend"
    iam_instance_profile_name = null  # 선택사항, 필요시 "your-iam-profile-name" 설정
    root_volume_size          = 20
  }
  instance2 = {
    instance_name             = "example-ec2-instance-2"
    instance_type             = "t3.micro"
    architecture              = "x86_64"
    subnet_index              = 1  # 두 번째 서브넷 사용
    security_group_ids        = ["sg-xxxxxxxxx"]
    team                      = "frontend"
    iam_instance_profile_name = null  # 선택사항, 필요시 "your-iam-profile-name" 설정
    root_volume_size          = 30
  }
  instance3 = {
    instance_name             = "example-ec2-instance-3"
    instance_type             = "t3.micro"
    architecture              = "x86_64"
    subnet_index              = 0  # 첫 번째 서브넷 사용
    security_group_ids        = ["sg-xxxxxxxxx"]
    team                      = "backend"
    iam_instance_profile_name = null  # 선택사항, 필요시 "your-iam-profile-name" 설정
    root_volume_size          = 20
  }
}

# 태그 설정 (선택사항)
# tags = {
#   Environment = "example"
#   Project     = "tving-assignment"
# }

