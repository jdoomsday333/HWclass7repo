########################## Public rtb ##########################

resource "aws_route_table" "terraform-public-rtb" {                   # Name of Public RT
  vpc_id = aws_vpc.thailand_vpc_tf.id                                 # State VPC

  # default gateway route 
  route {
    cidr_block = "0.0.0.0/0"                                          # Why 0.0.0.0/0 not 10.169.0.0/16 ? ? ?
    gateway_id = aws_internet_gateway.thailand_igw_tf.id              # igw for public subnets
  }

  tags = {
    Name = "terraform-public-rtb"                                     # Copy Public RT name
  }
}                                                                     # Make sure subnet and Name convention
                                                                      # is correct
resource "aws_route_table_association" "public-ap-southeast-7a" {     # Name or RT association
  subnet_id      = aws_subnet.public-ap-southeast-7a.id               # Name of Subnet
  route_table_id = aws_route_table.terraform-public-rtb.id            # Name of Route Table
}

resource "aws_route_table_association" "public-ap-southeast-7b" {
  subnet_id      = aws_subnet.public-ap-southeast-7b.id
  route_table_id = aws_route_table.terraform-public-rtb.id
}

resource "aws_route_table_association" "public-ap-southeast-7c" {
  subnet_id      = aws_subnet.public-ap-southeast-7c.id
  route_table_id = aws_route_table.terraform-public-rtb.id
}



########################## Private rtb ##########################
resource "aws_route_table" "terraform-private-rtb" {                   # Name of Public RT
  vpc_id = aws_vpc.thailand_vpc_tf.id                                  # State VPC

  # default gateway route 
  route {
    cidr_block     = "0.0.0.0/0"                                       # Why 0.0.0.0/0 not 10.169.0.0/16 ? ? ?
    nat_gateway_id = aws_nat_gateway.thailand_nat_tf.id                # NAT GW for Private Subnets
  }                                                                  ### Remember NAT GW has eip gives
                                                                     ### Private Subnets Public IP address
  tags = {
    Name = "terraform-private-rtb"                                     # Copy Private RT Name
  }
}                                                                      # Make sure subnet and Name convention
                                                                       # is correct
resource "aws_route_table_association" "private-ap-southeast-7a" {     # Name or RT association
  subnet_id      = aws_subnet.private-ap-southeast-7a.id               # Name of Subnet
  route_table_id = aws_route_table.terraform-private-rtb.id            # Name of Route Table
}

resource "aws_route_table_association" "private-ap-southeast-7b" {
  subnet_id      = aws_subnet.private-ap-southeast-7b.id
  route_table_id = aws_route_table.terraform-private-rtb.id
}

resource "aws_route_table_association" "private-ap-southeast-7c" {
  subnet_id      = aws_subnet.private-ap-southeast-7c.id
  route_table_id = aws_route_table.terraform-private-rtb.id
}

### How do we link a Basion host in the route table?
### What security group rules do you need