resource "aws_internet_gateway" "thailand_igw_tf" {   # igw name
  vpc_id = aws_vpc.thailand_vpc_tf.id                 # Name of VPC

  tags = {
    Name = "terraform_igw_tf"                         # Copy igw name
  }
}

### This allows subnets to communicate with internet
### You link you VPC network in Route Table
### igw is for public subnets to access internet