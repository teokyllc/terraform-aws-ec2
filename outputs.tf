output "instance_arn" {
  value = aws_instance.ec2.arn
}

output "instance_private_dns" {
  value = aws_instance.ec2.private_dns
}

output "instance_public_dns" {
  value = aws_instance.ec2.public_dns
}

output "instance_eip_id" {
  value = aws_eip.ec2_eip[*].id
}
