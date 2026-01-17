resource "aws_sns_topic" "asg_actions" {
  name = "asg-actions-topic"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.asg_actions.arn
  protocol  = "email"
  endpoint  = "johnny.martinez91@yahoo.com"
}

resource "aws_autoscaling_notification" "asg_notification" {
  group_names          = [aws_autoscaling_group.ASG-thailand.name]
  notifications        = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
   "autoscaling:EC2_INSTANCE_TERMINATE",
   "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
   "autoscaling:EC2_INSTANCE_TERMINATE_ERROR"
   ]

  topic_arn            = aws_sns_topic.asg_actions.arn
}
# Don't forget to test this file