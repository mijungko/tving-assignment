variable "instance_name" {
  description = "EC2 인스턴스 이름"
  type        = string
}

variable "instance_type" {
  description = "EC2 인스턴스 타입"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID (지정하지 않으면 최신 Amazon Linux 2023 사용)"
  type        = string
  default     = null
}

variable "architecture" {
  description = "인스턴스 아키텍처 (x86_64 또는 arm64)"
  type        = string
  default     = "x86_64"

  validation {
    condition     = contains(["x86_64", "arm64"], var.architecture)
    error_message = "architecture는 'x86_64' 또는 'arm64'여야 합니다."
  }
}

variable "subnet_id" {
  description = "EC2 인스턴스를 배치할 서브넷 ID"
  type        = string
}

variable "security_group_ids" {
  description = "보안 그룹 ID 목록 (빈 리스트일 경우 기본 보안 그룹이 할당됨)"
  type        = list(string)
  default     = []
}

variable "iam_instance_profile_name" {
  description = "IAM 인스턴스 프로파일 이름"
  type        = string
  default     = null
}

variable "team" {
  description = "인스턴스에 할당할 팀 태그"
  type        = string
}

variable "root_volume_size" {
  description = "루트 볼륨 크기 (GB)"
  type        = number
  default     = 20
}

variable "additional_ebs_volumes" {
  description = "추가 EBS 볼륨 설정"
  type = list(object({
    device_name           = string
    volume_size           = number
    delete_on_termination = bool
  }))
  default = []
}

variable "tags" {
  description = "추가 태그"
  type        = map(string)
  default     = {}
}

