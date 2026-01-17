resource "aws_eip" "thailand_eip_tf" {                     # eip name
  domain = "vpc"                                           # VPC ? ? ?

  tags = {
    Name = "thailand_eip_tf"                               # Copy eip name
  }

  depends_on = [aws_internet_gateway.thailand_igw_tf] # explict dependency 
}

##### Nat GW needs public Elastic IP ^^ 
### eip allows nat gw to use same ip for all private subnets to communicate with internet.

resource "aws_nat_gateway" "thailand_nat_tf" {             # Name of NAT GW
  allocation_id = aws_eip.thailand_eip_tf.id               # implict dependency for eip
  subnet_id     = aws_subnet.public-ap-southeast-7a.id     # Location of NAT GW subnet

  tags = {
    Name = "thailand_nat_tf"                               # Copy Name of NAT GW
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.thailand_igw_tf]
}