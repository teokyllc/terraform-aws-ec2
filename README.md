# terraform-aws-ec2
This is a Terraform module that deploys AWS EC2 instances.<br>
[AWS VPC](https://docs.aws.amazon.com/ec2/)<br>
[Terraform AWS Instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance.html)<br>

## Using specific versions of this module
You can use versioned release tags to ensure that your project using this module does not break when this module is updated in the future.<br>

<b>Repo latest commit</b><br>
```
module "ec2" {
  source = "github.com/teokyllc/terraform-aws-ec2"
  ...
```
<br>

<b>Tagged release</b><br>

```
module "ec2" {
  source = "github.com/teokyllc/terraform-aws-ec2?ref=1.0"
  ...
```
<br>

## Examples of using this module
This is an example of using this module something, fill in the rest.<br>

```
module "ec2" {
  source                                  = "github.com/teokyllc/terraform-aws-ec2?ref=1.0"
  ec2_name                                = "dev-vm"
  ami_most_recent                         = true
  ami_name                                = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
  ami_owner                               = "099720109477"
  subnet_id                               = "subnet-02fed44933e871ffd"
  security_groups                         = ["sg-db1f86ae"]
  instance_type                           = "r6a.2xlarge"
  associate_public_ip_address             = true
  disable_api_stop                        = true
  disable_api_termination                 = true
  ebs_optimized                           = false
  attach_eip                              = true
  iam_instance_profile                    = "Developer-VM"
  key_name                                = "tutor-local-ec2"
  monitoring                              = false
  user_data                               = null
  user_data_replace_on_change             = false
  network_interface_delete_on_termination = true
  volume_size                             = 100
  volume_type                             = "gp3"
  volume_delete_on_termination            = true
  volume_encrypted                        = true
  kms_key_id                              = null
  iops                                    = null
}
```

<br><br>
Module can be tested locally:<br>
```
git clone https://github.com/teokyllc/terraform-aws-ec2.git
cd terraform-aws-ec2

cat <<EOF > ec2.auto.tfvars
ec2_name                                = "dev-vm"
ami_most_recent                         = true
ami_name                                = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
ami_owner                               = "099720109477"
subnet_id                               = "subnet-02fed44933e871ffd"
security_groups                         = ["sg-db1f86ae"]
instance_type                           = "r6a.2xlarge"
associate_public_ip_address             = true
disable_api_stop                        = true
disable_api_termination                 = true
ebs_optimized                           = false
attach_eip                              = true
iam_instance_profile                    = "Developer-VM"
key_name                                = "tutor-local-ec2"
monitoring                              = false
user_data                               = null
user_data_replace_on_change             = false
network_interface_delete_on_termination = true
volume_size                             = 100
volume_type                             = "gp3"
volume_delete_on_termination            = true
volume_encrypted                        = true
kms_key_id                              = null
iops                                    = null
EOF

terraform init
terraform apply
```
