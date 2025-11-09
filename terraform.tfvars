aws_profile = "654654358397_SandboxAdminAccess"

# VPC 설정 
vpc_name = "tving-vpc"
vpc_cidr = "10.0.0.0/16"

# 프라이빗 서브넷 설정 
private_subnets = [
  { cidr = "10.0.1.0/24", az = "ap-northeast-2a" },
  { cidr = "10.0.2.0/24", az = "ap-northeast-2b" },
  { cidr = "10.0.3.0/24", az = "ap-northeast-2c" }
]

# EC2 인스턴스 설정 
instances = {
  instance1 = {
    instance_name             = "tving-ec2-instance-1"
    instance_type             = "c5.large"
    architecture              = "x86_64"
    subnet_index              = 0  # 첫 번째 서브넷 사용
    security_group_ids        = [""]
    team                      = "backend"
    iam_instance_profile_name = "test-role" 
    root_volume_size          = 30
  }
  instance2 = {
    instance_name             = "tving-ec2-instance-2"
    instance_type             = "t3.micro"
    architecture              = "x86_64"
    subnet_index              = 1  # 두 번째 서브넷 사용
    security_group_ids        = [""]
    team                      = "frontend"
    iam_instance_profile_name = "test-role"  
    root_volume_size          = 30
  }
  instance3 = {
    instance_name             = "tving-ec2-instance-3"
    instance_type             = "m6g.medium"
    architecture              = "arm64"
    subnet_index              = 2  # 세 번째 서브넷 사용
    security_group_ids        = [""]
    team                      = "analytics"
    iam_instance_profile_name = "test-role"  
    root_volume_size          = 100
  }
}
