resource "aws_lb_listener" "thailand_listener" {    # Name Listener
  load_balancer_arn = aws_lb.thailand_alb.arn       # Link to Load Balancer
  port              = 80                            # What is it Listening to? HTTP
  protocol          = "HTTP"

  default_action {                                  # What action is the LB Doing?
    type             = "forward"                    # Forwarding, Where? To Target Group
    target_group_arn = aws_lb_target_group.thailand_tg.arn    # TG Name
  }
}

#  data "aws_acm_certificate" "cert" {
#   domain   = "balerica-aisecops.com"
#   statuses = ["ISSUED"]
#   most_recent = true
# }


# resource "aws_lb_listener" "https" {
#   load_balancer_arn = aws_lb.app1_alb.arn
#   port              = 443
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
#   certificate_arn   = data.aws_acm_certificate.cert.arn



#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.app1_tg.arn
#   }


output "lb_dns_name" {
  value       = aws_lb.thailand_alb ##### Check this line
  description = "The DNS name of the App1 Load Balancer."
}