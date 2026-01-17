# for ASG EC2 instances

resource "aws_security_group" "AllowAllHTTP" {
  name        = "AllowAllHTTP"
  description = "Allow inbound HTTP and SSH from LB"
  vpc_id      = aws_vpc.thailand_vpc_tf.id
  # <resource type>.<resource local name>.<attribute type> 

  tags = {
    Name = "AllowAllHTTP"
  }
}

resource "aws_vpc_security_group_ingress_rule" "web_allow_http" {
  security_group_id = aws_security_group.AllowAllHTTP.id
  # ALB SG ID goes here (ALB is the source of HTTP traffic for web apps)
  description                  = "HTTP from alb"
  referenced_security_group_id = aws_security_group.sgLB.id
  from_port                    = 80
  ip_protocol                  = "tcp"
  to_port                      = 80
}

resource "aws_vpc_security_group_ingress_rule" "web_allow_ssh" {
  security_group_id = aws_security_group.AllowAllHTTP.id
  description       = "SSH From Internet"
  cidr_ipv4         = "10.69.0.0/16"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "web_tier_allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.AllowAllHTTP.id
  description       = "Allow all traffic out"
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
###This is another why to create a security group for the LoadBalancer.