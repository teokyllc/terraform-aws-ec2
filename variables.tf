variable "ami_most_recent" {
  type        = bool
  description = "If more than one result is returned, use the most recent AMI."
  default     = true
}

variable "ami_name" {
  type        = string
  description = "Name for filtering AMI."
  default     = null
}

variable "ami_owner" {
  type        = string
  description = "AMI owner to limit search. Valid values: an AWS account ID, self (the current account), or an AWS owner alias (e.g., amazon, aws-marketplace, microsoft)."
  default     = null
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID to create the ENI in."
  default     = null
}

variable "private_ips" {
  type        = list(string)
  description = "List of private IPs to assign to the ENI in sequential order."
  default     = null
}

variable "security_groups" {
  type        = list(string)
  description = "List of private IPs to assign to the ENI in sequential order."
  default     = null
}

variable "instance_type" {
  type        = string
  description = "Instance type to use for the instance."
  default     = null
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Whether to associate a public IP address with an instance in a VPC."
  default     = false
}

variable "availability_zone" {
  type        = string
  description = "AZ to start the instance in."
  default     = false
}

variable "disable_api_stop" {
  type        = bool
  description = "If true, enables EC2 Instance Stop Protection."
  default     = false
}

variable "disable_api_termination" {
  type        = bool
  description = "If true, enables EC2 Instance Termination Protection."
  default     = false
}

variable "ebs_optimized" {
  type        = bool
  description = "If true, the launched EC2 instance will be EBS-optimized."
  default     = false
}

variable "attach_eip" {
  type        = bool
  description = "If true, an Elastic IP Address will be applied to the instance."
  default     = false
}

variable "iam_instance_profile" {
  type        = string
  description = "IAM Instance Profile to launch the instance with."
  default     = null
}

variable "key_name" {
  type        = string
  description = "Key name of the Key Pair to use for the instance."
  default     = null
}

variable "monitoring" {
  type        = bool
  description = "If true, the launched EC2 instance will have detailed monitoring enabled."
  default     = false
}

variable "user_data" {
  description = "User data to provide when launching the instance."
  default     = false
}

variable "user_data_replace_on_change" {
  type        = bool
  description = "When used in combination with user_data or user_data_base64 will trigger a destroy and recreate when set to true."
  default     = false
}

variable "network_interface_delete_on_termination" {
  type        = bool
  description = "When used in combination with user_data or user_data_base64 will trigger a destroy and recreate when set to true."
  default     = false
}

variable "volume_size" {
  type        = string
  description = "Size of the volume in gibibytes (GiB)."
  default     = null
}

variable "volume_type" {
  type        = string
  description = "Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1"
  default     = "gp3"
}

variable "volume_delete_on_termination" {
  type        = bool
  description = "Whether the volume should be destroyed on instance termination."
  default     = false
}

variable "volume_encrypted" {
  type        = bool
  description = "When used in combination with user_data or user_data_base64 will trigger a destroy and recreate when set to true."
  default     = false
}

variable "kms_key_id" {
  type        = string
  description = "Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume."
  default     = null
}

variable "iops" {
  type        = number
  description = "Amount of provisioned IOPS. Only valid for volume_type of io1, io2 or gp3."
  default     = null
}

variable "tags" {
  type        = map
  description = "Map of tags to assign to the device."
  default     = null
}

variable "ec2_name" {
  type        = string
  description = "Name of the EC2 instance."
  default     = null
}

variable "create_security_group" {
  type        = bool
  description = "If true, creates a security group."
}

variable "security_group_name" {
  type        = string
  description = "Name of the security group."
}

variable "security_group_description" {
  type        = string
  description = "Security group description. Defaults to Managed by Terraform."
  default     = null
}

variable "security_group_vpc_id" {
  type        = string
  description = "VPC ID."
}

variable "security_group_rules" {
  type        = map
  description = "Provides a security group rule resource."
  default     = null
}