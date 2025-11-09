variable "aws_profile" {
  description = "AWS IAM User 프로파일"
  type        = string
}

variable "vpc_name" {
  description = "VPC의 이름"
  type        = string
  default     = "example-vpc-multiple-ec2"
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

variable "instances" {
  description = "EC2 인스턴스 설정 맵"
  type = map(object({
    instance_name             = string
    instance_type             = string
    architecture              = string
    subnet_id                 = optional(string)  # 실제 서브넷 ID (예: "subnet-xxxxx")
    subnet_index              = optional(number)  # VPC 모듈의 서브넷 인덱스 (0부터 시작)
    security_group_ids        = optional(list(string), [])  # 보안 그룹 ID 목록 (빈 리스트일 경우 기본 보안 그룹 할당)
    team                      = string
    iam_instance_profile_name = optional(string)
    root_volume_size          = optional(number, 20)
    additional_ebs_volumes = optional(list(object({
      device_name           = string
      volume_size           = number
      delete_on_termination = bool
    })), [])
    tags        = optional(map(string), {})
  }))

  validation {
    condition = alltrue([
      for k, v in var.instances : contains(["x86_64", "arm64"], v.architecture)
    ])
    error_message = "architecture는 'x86_64' 또는 'arm64'여야 합니다."
  }

  validation {
    condition = alltrue([
      for k, v in var.instances : (v.subnet_id != null) != (v.subnet_index != null)
    ])
    error_message = "subnet_id와 subnet_index 중 하나만 제공해야 합니다."
  }
}

variable "tags" {
  description = "추가 태그"
  type        = map(string)
  default = {
    Environment = "example"
    Project     = "tving-assignment"
  }
}

