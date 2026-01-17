resource "aws_lb" "thailand_alb" {                     # Name of LB, copy below
  name               = "thailandalb"                   # Name in console, AlfaNumeric, no spaces
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sgLB.id]   # State Security Group for Load Balancer
  subnets = [                                         # State Subnets that will be Load Balanced
    aws_subnet.public-ap-southeast-7a.id,             # Probably Public Subnets because unique Public IP
    aws_subnet.public-ap-southeast-7b.id,             # and internet facing
    aws_subnet.public-ap-southeast-7c.id
  ]
  enable_deletion_protection = false                  # Allows deletion of LB
  #Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "thailand_alb"
    Service = "LoadBalancer"
    Owner   = "Johnny"
    Project = "loadbalancer"
  }
}
