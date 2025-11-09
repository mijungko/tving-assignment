# 예시 디렉터리

이 디렉터리에는 VPC 모듈과 EC2 모듈을 사용하는 다양한 예시가 포함되어 있습니다.

## 예시 목록

### vpc-basic

기본적인 VPC와 프라이빗 서브넷 2개를 생성하는 예시입니다.

- VPC CIDR: 10.0.0.0/16
- 서브넷: 2개 (ap-northeast-2a, ap-northeast-2b)

### vpc-custom

커스텀 CIDR 블록과 3개의 가용 영역에 프라이빗 서브넷을 생성하는 예시입니다.

- VPC CIDR: 172.16.0.0/16
- 서브넷: 3개 (ap-northeast-2a, ap-northeast-2b, ap-northeast-2c)

### vpc-with-ec2

VPC와 EC2 인스턴스를 함께 생성하는 예시입니다.

- VPC와 프라이빗 서브넷 생성
- EC2 인스턴스 (t3.micro, x86_64) 생성
- EBS 암호화, gp3 볼륨, T 시리즈 CPU 크레딧 제한(standard) 포함

### vpc-with-ec2-graviton

VPC와 EC2 Graviton(ARM64) 인스턴스를 함께 생성하는 예시입니다.

- VPC와 프라이빗 서브넷 생성
- EC2 인스턴스 (t4g.micro, arm64) 생성
- EBS 암호화, gp3 볼륨 포함

### vpc-with-multiple-ec2

VPC와 여러 개의 EC2 인스턴스를 함께 생성하는 예시입니다.

- VPC와 프라이빗 서브넷 생성
- EC2 인스턴스 3개 생성 (for_each 사용)
- 각 인스턴스마다 다른 설정 가능 (팀, 볼륨 크기 등)
- EBS 암호화, gp3 볼륨 포함

## 사용 방법

각 예시 디렉터리로 이동하여 Terraform 명령어를 실행하세요:

```bash
cd examples/vpc-basic
# terraform.tfvars 파일에서 aws_profile 설정
terraform init
terraform plan
terraform apply
```
