>>> 00-auth.tf <<<
>>> 01-vpc.tf <<<
resource "aws_vpc" "thailand_vpc_tf" {     #Name of VPC
  cidr_block           = "10.69.0.0/16"    #CIDR Block

>>> 02-subnets.tf <<<

### Public
# public-ap-southeast-7a   Has NAT Gateway
10.69.180.0/24
# public-ap-southeast-7b
10.69.181.0/24
# public-ap-southeast-7c
10.69.182.0/24

### Privage
# private-ap-southeast-7a
10.69.190.0/24
# private-ap-southeast-7b
10.69.191.0/24
# private-ap-southeast-7c
10.69.192.0/24

>>> 03-igw.tf <<<
resource "aws_internet_gateway" "thailand_igw_tf"

>>> 04-nat.tf <<<
resource "aws_nat_gateway" "thailand_nat_tf"
resource "aws_eip" "thailand_eip_tf"
NAT GW requires an eip to allow private subnets to communicate with internet

>>> 05-rtb.tf <<<
resource "aws_route_table" "terraform-public-rtb"

resource "aws_route_table" "terraform-private-rtb"

Two tables are needed and make sure the subnets and name conventions are properly stated

>>> 06-sg.tf <<<
##### esource "aws_security_group" "thailand_ec2_sg"
ingress
HTTP, SSH, RDP
egress
All
##### resource "aws_security_group" "sgLB"
ingress
HTTP
egress
All

>>> 06a-sgLoadBalancer.tf <<<
Another way to write code for the load balancer


>>> 07-ec2.tf <<<
Will create Bastion host and Privet EC2 in this file

>>> 07a-templet.tf <<<
Lauch templets require:
Name, image-id, instance_type, key_name, security_group, User Data
Launch templet name will be linked in asg.tf file.

>>> 08a-tg.tf <<<
resource "aws_lb_target_group" "thailand_tg"
Target group listens to HTTP and targets instances
Target Group runs health checks

>>> 08b-loadbalancer.tf <<<
resource "aws_lb" "thailand_alb"
The Load Balancer has a security group attached
Load Balancer for public subnets

>>> 08c-listerner.tf <<<
resource "aws_lb_listener" "thailand_listener"
Forwards HTTP traffic to target group

>>> 09a-asg.tf <<<
ASG for private subnets
ASG launches templets
Max/min, time, health check type
ASG linked to the Target Group
Target Group has health check rules

>>> 09b-scaling-policy.tf <<<
Configurations of how ASG scales
Links Load Balancer and Target GrouP

>>> 09c-attachment.tf <<<
Links ASG and Target Group

>>> 98-data.tf <<<
NOT BUILT OUT YET

>>> 99-output.tf <<<

>>> user_data.sh <<<
This is where the user data for instances are saved.

>>> .gitignore <<<
Copy over this file.

>>> readmefile.txt <<<
This is where I put my notes
Open another file for new notes
















