# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "asg_attachment" {           # Name of resource Auto Scaling attachment
  autoscaling_group_name = aws_autoscaling_group.ASG-thailand.id   # Name of ASG
  lb_target_group_arn    = aws_lb_target_group.thailand_tg.arn     # Name of Target Group
}

# This links your ASG to Target Group for load balancing