resource "aws_launch_template" "thailand_lt" {                    # Name of LT
  name                   = "thailand_lt"                          # Name in console
  image_id               = "ami-05b626c6a28cc7b8b"                # AMI in Console
  instance_type          = "t3.micro"                             # Type, Different if running Windows
  key_name               = "Thaikp"                               # Key Pair For Your VPC
  vpc_security_group_ids = [aws_security_group.AllowAllHTTP.id]   # SG for EC2s
  user_data              = filebase64("user_data.sh")             # FmT for Pulling files

tag_specifications {                    # These Tags appear in generated EC2 tags
    resource_type = "instance"          # Tags generated in instances
    tags = {
      Name    = "thailand_lt"
      Service = "terraform"
      Owner   = "Johnny"
    }
  }

  lifecycle {
    create_before_destroy = true        # Not sure ? ? Create then destroy
  }
}

### Both of these LT are for Load balancers using two different types of Security groups
### Both should work with the Load Balancer


resource "aws_launch_template" "LBthailand" {
  name_prefix            = "LBthailand"
  image_id               = "ami-05b626c6a28cc7b8b"
  instance_type          = "t3.micro"
  key_name               = "Thaikp"
  vpc_security_group_ids = [aws_security_group.sgLB.id]
  user_data              = filebase64("user_data2.sh")

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "LBthailand"
      Service = "Terraform"
      Owner   = "Johnny"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}


##########Data Source LT##########
###Week11 Launch templet
/* data "aws_ami" "Amazon-Linux-2023-AMI" {
  most_recent = true
  owners      = ["amazon"]


  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
} */