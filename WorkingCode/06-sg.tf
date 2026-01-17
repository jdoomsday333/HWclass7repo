############### Security Group for Standard EC2 ##############

resource "aws_security_group" "thailand_ec2_sg" {   # Name of SG, Copy below
  name        = "thailand_ec2_sg"                   # This is the Security group used for EC2s
  description = "ec2 Security Group"                # Private or Public ? ? ?
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


############### SecurityGroup for LoadBalancer #########

resource "aws_security_group" "sgLB" {               # Name of SG, Copy below
  name        = "sgLB"                               # This Security Group allow HTTP traffic to LB
  description = "Security group for LB"
  vpc_id      = aws_vpc.thailand_vpc_tf.id

  ingress {                                          # Allows all HTTP traffic into Load Balancer
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {                                           # Allows All Outbound Traffic
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "sgLB"
    Service = "LoadBalancer"
    Owner   = "Johnny"
  }

}
