output "lb_url" {
  value       = "http://${aws_lb.thailand_alb.dns_name}"    # Name of LB
  description = "fully qualified domain name/URL for LB"
}

# This command outputs the URL of the Load Balancer