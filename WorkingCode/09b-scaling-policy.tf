resource "aws_autoscaling_policy" "scaling-policy" {                 # Name of the Policy
  name                   = "scaling-policy"                          # Name in Console
  autoscaling_group_name = aws_autoscaling_group.ASG-thailand.name   # Name of ASG
  policy_type            = "TargetTrackingScaling"                   # Not sure ? ? ?

  target_tracking_configuration {                                   # Target tracking config block 
    predefined_metric_specification {                               # Predefined metric block
      predefined_metric_type = "ASGAverageCPUUtilization"           # Metric type
    }
    target_value = 40.0                                             # Target value (in % CPU)
  }
}


# API docs on this: https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_PredefinedMetricSpecification.html

resource "aws_autoscaling_policy" "scaling_requests" {              # Name of the Policy
  name                   = "scaling_requests"                       # Name in Console
  autoscaling_group_name = aws_autoscaling_group.ASG-thailand.name  # Change to your ASG name
  policy_type            = "TargetTrackingScaling"                  # Policy type

  target_tracking_configuration {                                  # Target tracking config block
    predefined_metric_specification {                              # Predefined metric block
      predefined_metric_type = "ALBRequestCountPerTarget"          # Metric type
      resource_label         = "${aws_lb.thailand_alb.arn_suffix}/${aws_lb_target_group.thailand_tg.arn_suffix}"
    }                          ######### Link to LB and TG
    target_value = 20                                              # Target value (in requests)
  }
}