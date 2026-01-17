resource "aws_lb_target_group" "thailand_tg" {    # Name of the Target Group, Copy below
  name        = "thailandtg"                      # Name in Console, Alfanumeric, no spaces
  port        = 80
  protocol    = "HTTP"                            # What Type of traffic is TG looking For? HTTP
  vpc_id      = aws_vpc.thailand_vpc_tf.id        # VPC ID
  target_type = "instance"                        # Where is traffic going? EC2s

  health_check {                     # LB sends health checks to EC2s
    enabled             = true       # Turn on Health Checks
    interval            = 30         # Send Check every 30 Sec. 
    path                = "/"        # Donno ? ? ?
    protocol            = "HTTP"     # Sends Health Checks with HTTP
    healthy_threshold   = 5          #
    unhealthy_threshold = 2          #
    timeout             = 5          #
    matcher             = "200"      #
  }

  tags = {
    Name    = "thailand_tg"
    Service = "TargetGroup"
    Owner   = "Johnny"
  }
}