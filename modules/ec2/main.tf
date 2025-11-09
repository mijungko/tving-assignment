data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-${var.architecture}"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = [var.architecture]
  }
}

resource "aws_instance" "this" {
  ami                    = var.ami_id != null ? var.ami_id : data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = length(var.security_group_ids) > 0 ? [for sg in var.security_group_ids : sg if sg != ""] : []
  iam_instance_profile   = var.iam_instance_profile_name

  root_block_device {
    volume_type           = "gp3"
    volume_size           = var.root_volume_size
    encrypted             = true
    delete_on_termination = true

    tags = merge(
      var.tags,
      {
        Name = var.instance_name
        Team = var.team
      }
    )
  }

  dynamic "ebs_block_device" {
    for_each = var.additional_ebs_volumes
    content {
      device_name           = ebs_block_device.value.device_name
      volume_type           = "gp3"
      volume_size           = ebs_block_device.value.volume_size
      encrypted             = true
      delete_on_termination = ebs_block_device.value.delete_on_termination

      tags = merge(
        var.tags,
        {
          Name = "${var.instance_name}-${ebs_block_device.value.device_name}"
          Team = var.team
        }
      )
    }
  }

  dynamic "credit_specification" {
    for_each = startswith(var.instance_type, "t") ? [1] : []
    content {
      cpu_credits = "standard"  # T 시리즈 인스턴스는 항상 크레딧 제한 적용
    }
  }

  tags = merge(
    var.tags,
    {
      Name = var.instance_name
      Team = var.team
    }
  )
}

