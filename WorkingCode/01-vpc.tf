resource "aws_vpc" "thailand_vpc_tf" {     # Name of VPC
  cidr_block           = "10.69.0.0/16"    # CIDR Block
  instance_tenancy     = "default"         # optional, default option is setting this argument to default
  enable_dns_hostnames = true
  enable_dns_support   = true              # optional, defaults to true 

  tags = {
    Name = "thailand_vpc_tf"
  }
}