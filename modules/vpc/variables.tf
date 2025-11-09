variable "vpc_name" {
  description = "VPC의 이름"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC의 CIDR 블록"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
  description = "프라이빗 서브넷의 정보 (CIDR 및 가용 영역)"
  type = list(object({
    cidr = string
    az   = string
  }))
  default = []
}

variable "tags" {
  description = "추가 태그"
  type        = map(string)
  default     = {}
}

