variable "aws_profile" {
  description = "AWS IAM User 프로파일"
  type        = string
}

variable "vpc_name" {
  description = "VPC의 이름"
  type        = string
  default     = "example-vpc"
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

variable "tags" {
  description = "추가 태그"
  type        = map(string)
  default = {
    Environment = "example"
    Project     = "tving-assignment"
    Example     = "basic"
  }
}

