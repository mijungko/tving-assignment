variable "aws_profile" {
  description = "AWS IAM User 프로파일"
  type        = string
}

variable "security_group_ids" {
  description = "보안 그룹 ID 목록"
  type        = list(string)
}

variable "vpc_name" {
  description = "VPC의 이름"
  type        = string
  default     = "example-vpc-ec2-graviton"
}

variable "vpc_cidr" {
  description = "VPC의 CIDR 블록"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
  description = "프라이빗 서브넷의 정보"
  type = list(object({
    cidr = string
    az   = string
  }))
  default = [
    { cidr = "10.0.1.0/24", az = "ap-northeast-2a" },
    { cidr = "10.0.2.0/24", az = "ap-northeast-2b" }
  ]
}

variable "instance_name" {
  description = "EC2 인스턴스 이름"
  type        = string
  default     = "example-ec2-graviton-instance"
}

variable "instance_type" {
  description = "EC2 인스턴스 타입"
  type        = string
  default     = "t4g.micro"
}

variable "architecture" {
  description = "인스턴스 아키텍처 (x86_64 또는 arm64)"
  type        = string
  default     = "arm64"
}

variable "team" {
  description = "인스턴스에 할당할 팀 태그"
  type        = string
  default     = "backend"
}

variable "iam_instance_profile_name" {
  description = "IAM 인스턴스 프로파일 이름"
  type        = string
  default     = null
}

variable "root_volume_size" {
  description = "루트 볼륨 크기 (GB)"
  type        = number
  default     = 30
}

variable "tags" {
  description = "추가 태그"
  type        = map(string)
  default = {
    Environment = "example"
    Project     = "tving-assignment"
  }
}

