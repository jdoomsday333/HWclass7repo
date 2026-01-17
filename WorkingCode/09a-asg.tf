resource "aws_autoscaling_group" "ASG-thailand" {                # Name of ASG
  vpc_zone_identifier = [aws_subnet.private-ap-southeast-7a.id,  # ASG scales private subnets
    aws_subnet.private-ap-southeast-7b.id,
  aws_subnet.private-ap-southeast-7c.id]
  # not an idealy argument for dynamic scaling 
  #desired_capacity   = 1
  max_size = 9      # max number of instances
  min_size = 3      # min number of instances/one per AZ

  # shorten values for demo purposes (optional)
  default_cooldown          = 60      # Seconds for cooldown period
  default_instance_warmup   = 60      # Seconds for instance warmup
  health_check_grace_period = 120     # Seconds for health check grace period

  # where is the asg health check config from (for autohealing)
  health_check_type = "ELB"           # using ELB health checks
  force_delete = true                 # force delete ASG even with instances attached
  target_group_arns = [aws_lb_target_group.thailand_tg.arn] # attach to target group

  # using latest rather than default version for simplicity 
  launch_template {
    id      = aws_launch_template.thailand_lt.id   # launch template id
    version = "$Latest"                            # use latest version
  }

  # tags for instances created by ASG
  tag {
    key                 = "asg-ec2"
    value               = "web-app"
    propagate_at_launch = true
  }
}