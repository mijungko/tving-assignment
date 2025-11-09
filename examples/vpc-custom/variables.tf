variable "aws_profile" {
  description = "AWS IAM User 프로파일"
  type        = string
}

variable "vpc_name" {
  description = "VPC의 이름"
  type        = string
  default     = "example-custom-vpc"
}

variable "vpc_cidr" {
  description = "VPC의 CIDR 블록"
  type        = string
  default     = "172.16.0.0/16"
}

variable "private_subnets" {
  description = "프라이빗 서브넷의 정보"
  type = list(object({
    cidr = string
    az   = string
  }))
  default = [
    { cidr = "172.16.1.0/24", az = "ap-northeast-2a" },
    { cidr = "172.16.2.0/24", az = "ap-northeast-2b" },
    { cidr = "172.16.3.0/24", az = "ap-northeast-2c" }
  ]
}

variable "tags" {
  description = "추가 태그"
  type        = map(string)
  default = {
    Environment = "example"
    Project     = "tving-assignment"
    Example     = "custom"
    ManagedBy   = "terraform"
  }
}

