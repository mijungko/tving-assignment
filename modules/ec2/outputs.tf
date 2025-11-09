output "instance_id" {
  description = "EC2 인스턴스 ID"
  value       = aws_instance.this.id
}

output "instance_arn" {
  description = "EC2 인스턴스 ARN"
  value       = aws_instance.this.arn
}

output "instance_private_ip" {
  description = "EC2 인스턴스 프라이빗 IP"
  value       = aws_instance.this.private_ip
}

output "instance_public_ip" {
  description = "EC2 인스턴스 퍼블릭 IP (있는 경우)"
  value       = aws_instance.this.public_ip
}

output "root_volume_id" {
  description = "루트 볼륨 ID"
  value       = aws_instance.this.root_block_device[0].volume_id
}

