# tving-assignment

Terraform-based infrastructure assignment

## 프로젝트 구조

modules 이하에는 각 Terraform resource 들의 재사용가능한 모듈이 선언되어 있습니다.
이 프로젝트에서는 VPC 를 생성 후, EC2 인스턴스를 생성할 수 있습니다.
예시의 경우 examples 폴더에서 확인할 수 있습니다.

```
tving-assignment/
├── modules/
│   ├── vpc/              # VPC 모듈
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── ec2/              # EC2 모듈
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── examples/             # 사용 예시
│   ├── vpc-basic/        # 기본 VPC 예시
│   ├── vpc-custom/       # 커스텀 VPC 예시
│   ├── vpc-with-ec2/     # VPC + EC2 예시
│   ├── vpc-with-ec2-graviton/  # VPC + EC2 Graviton 예시
│   └── vpc-with-multiple-ec2/  # VPC + 여러 EC2 인스턴스 예시
├── main.tf               # 실제 리소스 생성
├── provider.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── .gitignore
```

## 사용 방법

프로젝트 루트 디렉터리에서 Terraform 명령어를 실행합니다.
먼저 `terraform.tfvars` 파일을 생성하여 IAM 사용자 프로파일을 설정해야 합니다.

### 1. 사전 준비

- AWS CLI가 설치되어 있어야 합니다
- IAM 사용자 프로파일이 설정되어 있어야 합니다 (`~/.aws/credentials`)

### 2. 환경 변수 설정

프로젝트 루트 디렉터리의 `terraform.tfvars` 파일에서 IAM 사용자 프로파일을 설정합니다:

```hcl
aws_profile = "your-iam-user-profile"
```

### 3. Terraform 초기화 및 실행

```bash
# Terraform 초기화
terraform init

# 실행 계획 확인
terraform plan

# 인프라 생성
terraform apply
```

## 주요 설정

이 프로젝트는 AWS 서울 리전(ap-northeast-2)을 기본으로 사용하며, IAM 사용자 프로파일을 통한 인증을 사용합니다.

- **기본 리전**: `ap-northeast-2`
- **Terraform 버전**: `>= 1.5.7`
- **AWS Provider**: `~> 5.0`
- **인증**: IAM 사용자 프로파일 사용

## VPC 모듈

VPC 모듈은 AWS VPC와 관련된 네트워크 리소스를 생성합니다.
현재는 프라이빗 서브넷만 생성하도록 구성되어 있습니다.

생성되는 리소스:

- VPC
- 프라이빗 서브넷 (2개, 기본값)
- 프라이빗 라우팅 테이블 및 연관 관계

## EC2 모듈

EC2 모듈은 AWS EC2 인스턴스와 관련된 컴퓨팅 리소스를 생성합니다.
EBS 암호화, gp3 볼륨, T 시리즈 CPU 크레딧 설정을 지원합니다.
보안 그룹과 IAM 인스턴스 프로파일은 외부에서 ID를 받아서 사용합니다.

**보안 참고사항**: 보안을 위해 SSH를 통한 직접 접속은 권장하지 않습니다.
대신 AWS Systems Manager Session Manager나 VPN을 통한 접속을 사용하는 것을 권장합니다.

주요 기능:

- 인스턴스당 별도의 팀 태그 할당
- EBS 암호화 적용 (루트 볼륨 및 추가 볼륨)
- gp3 볼륨 타입 사용
- T 시리즈 인스턴스 CPU 크레딧 제한 설정 (항상 standard로 고정)
- x86_64 및 ARM64(Graviton) 아키텍처 지원
- 별도의 AMI id 를 입력하지 않을 경우, Amazon 의 최신 AMI 사용
- 보안 그룹 ID를 외부에서 받아서 사용
- IAM 인스턴스 프로파일 이름을 외부에서 받아서 사용

생성되는 리소스:

- EC2 인스턴스
- EBS 볼륨 (암호화됨, gp3)

필수 입력:

- 보안 그룹 ID 목록 (`security_group_ids`)
- IAM 인스턴스 프로파일 이름 (`iam_instance_profile_name`)
