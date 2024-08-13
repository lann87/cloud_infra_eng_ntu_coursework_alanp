![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)
# Assignment 2.7 - Security Groups
### Individual assignment

## Brief:  
**The objective of this assignment is to gain a deeper understanding of AWS security groups**
> Instructions:
>    Open AWS Console
>    Create a new EC2 instance with a new security group:
>        Name: “"yourname"SSHSecurityGroup”
>        Description: “Security Group To Allow SSH from my IP range(s)”
>        VPC: < Choose Any >
>        Inbound Rules: - Type: SSH - Protocol: TCP - Source: My IP

**Finding out address of My IP:**
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module2/assignment2.7/ss_myIP.png)

**Security group attributes**
[Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module2/assignment2.7/ss_tf_sgGroup_attributes.png)

**Security group launched using Terraform**
[Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module2/assignment2.7/ss_tf-apply_sg_asmt.png)

Terraform HCL files:
1.  Compute
```sh
resource "aws_instance" "alanp_ec2_sg" {
  ami = data.aws_ami.amz_linux_2.id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.alanp-sg-a2.id]

  tags = {
    Name = var.ec2_name
  }
}

data "aws_ami" "amz_linux_2" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  
  owners = ["137112412989"]
}

output "ami_info" {
  value = data.aws_ami.amz_linux_2.id
}
```