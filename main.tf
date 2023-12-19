resource "aws_eip" "ec2_eip" {
  count    = var.attach_eip ? 1 : 0
  instance = aws_instance.ec2.id
  domain   = "vpc"
}

resource "aws_instance" "ec2" {
  ami                         = data.aws_ami.ec2_ami.id
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  availability_zone           = var.availability_zone
  disable_api_stop            = var.disable_api_stop
  disable_api_termination     = var.disable_api_termination
  ebs_optimized               = var.ebs_optimized
  iam_instance_profile        = var.iam_instance_profile
  key_name                    = var.key_name
  monitoring                  = var.monitoring
  user_data                   = var.user_data
  user_data_replace_on_change = var.user_data_replace_on_change
  vpc_security_group_ids      = var.security_groups

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    delete_on_termination = var.volume_delete_on_termination
    encrypted             = var.volume_encrypted
    kms_key_id            = var.kms_key_id
    iops                  = var.iops
  }

  tags   = merge(var.tags, {
    Name = var.ec2_name
  })

  lifecycle {
    ignore_changes = [ami]
  }
}
