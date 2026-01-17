########################## Public subnets ##########################


resource "aws_subnet" "public-ap-southeast-7a" {         # Name of Sunbet
  vpc_id                  = aws_vpc.thailand_vpc_tf.id   # Name of the VPC
  cidr_block              = "10.69.180.0/24"             # CIDR Public a
  availability_zone       = "ap-southeast-7a"            # Specify AZ 
  map_public_ip_on_launch = true                         # Allow public IPs to be assigned 

  tags = {
    Name = "public-ap-southeast-7a"                      # Copy Name of subnet
  }
}


resource "aws_subnet" "public-ap-southeast-7b" {          # Name of Subnet
  vpc_id                  = aws_vpc.thailand_vpc_tf.id    # Name of VPC
  cidr_block              = "10.69.181.0/24"              # CIDR Public b
  availability_zone       = "ap-southeast-7b"             # specify AZ 
  map_public_ip_on_launch = true                          # allow public IPs to be assigned 

  tags = {
    Name = "public-ap-southeast-7b"                       # Copy Name of Subnet
  }
}


resource "aws_subnet" "public-ap-southeast-7c" {          # Name of Subnet
  vpc_id                  = aws_vpc.thailand_vpc_tf.id    # Name of VPC
  cidr_block              = "10.69.182.0/24"              # CIDR Public b
  availability_zone       = "ap-southeast-7c"             # specify AZ 
  map_public_ip_on_launch = true                          # allow public IPs to be assigned 

  tags = {
    Name = "public-ap-southeast-7c"                       # Copy Name of Subnet
  }
}







########################## Private subnets ##########################

resource "aws_subnet" "private-ap-southeast-7a" {           # Name of Sunbet
  vpc_id                  = aws_vpc.thailand_vpc_tf.id      # Name of VPC
  cidr_block              = "10.69.190.0/24"                # CIDR Private a
  availability_zone       = "ap-southeast-7a"               # specify AZ 
  map_public_ip_on_launch = false

  tags = {
    Name = "private-ap-southeast-7a"                       # Copy Name of Subnet
  }
}


resource "aws_subnet" "private-ap-southeast-7b" {           # Name of Sunbet
  vpc_id                  = aws_vpc.thailand_vpc_tf.id      # Name of VPC
  cidr_block              = "10.69.191.0/24"                # CIDR Private b
  availability_zone       = "ap-southeast-7b"               # specify AZ 
  map_public_ip_on_launch = false
  tags = {
    Name = "private-ap-southeast-7b"                       # Copy Name of Subnet
  }
}


resource "aws_subnet" "private-ap-southeast-7c" {           # Name of Sunbet
  vpc_id                  = aws_vpc.thailand_vpc_tf.id      # Name of VPC
  cidr_block              = "10.69.192.0/24"                # CIDR Private c
  availability_zone       = "ap-southeast-7c"               # specify AZ 
  map_public_ip_on_launch = false

  tags = {
    Name = "private--ap-southeast-7c"                       # Copy Name of Subnet
  }
}