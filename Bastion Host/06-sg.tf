############### Security Group for Public EC2 ##############

resource "aws_security_group" "thailand_bastion_sg" {   # Name of SG, Copy below
  name        = "thailand_bastion_sg"                   # This is the Security group used for EC2s
  description = "Bastion Host"                        # Private or Public ? ? ?
  vpc_id      = aws_vpc.thailand_vpc_tf.id

  ingress {                                         # Allows HTTP traffic
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {                                         # Allows SSH traffic
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {                                         # Allows RDP traffic
    description = "RDP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {                                         # Allows All Outbound Traffic
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "thailand_ec2_sg"
    Service = "ec2sg"
    Owner   = "Johnny"
  }
}


############### SecurityGroup for Private EC2 #########

resource "aws_security_group" "thailand_private_sg" {               # Name of SG, Copy below
  name        = "thailand_private_sg"                               # This Security Group allow HTTP traffic to LB
  description = "Private EC2"                              # Description
  vpc_id      = aws_vpc.thailand_vpc_tf.id

  ingress {                                          # Allows all HTTP traffic into Load Balancer
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.10.180.0/24"]
  }

  egress {                                           # Allows All Outbound Traffic
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "SGforBastionHost"
    Service = "SGforBastionHost"
    Owner   = "Johnny"
  }

}
