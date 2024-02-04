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
  vpc_security_group_ids      = var.create_security_group ? [aws_security_group.security_group[0].id] : var.security_groups

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

resource "aws_security_group" "security_group" {
  count       = var.create_security_group ? 1 : 0
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.security_group_vpc_id
  tags    = merge(var.tags, {
    Name  = var.security_group_name
  })
}

resource "aws_security_group_rule" "security_group_rules" {
  for_each                 = var.security_group_rules
  description              = each.value.description
  type                     = each.value.type
  from_port                = each.value.from_port
  to_port                  = each.value.to_port
  protocol                 = each.value.protocol
  cidr_blocks              = each.value.cidr_blocks
  source_security_group_id = each.value.source_security_group_id
  security_group_id        = aws_security_group.security_group.id
}