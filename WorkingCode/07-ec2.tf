# resource "aws_instance" "thailand_tf_ec2" {
#   ami                         = "ami-0b9a325ab140afeee"
#   associate_public_ip_address = true
#   instance_type               = "t3.micro"
#   # key_name = 
#   # Select security group you will use Private/Public/LB/BastionHost
#   vpc_security_group_ids = [aws_security_group.thailand_ec2_sg.id]
#   subnet_id              = aws_subnet.public_c.id

#   user_data = filebase64("user_data.sh")

#   tags = {
#     Name = "thailand_tf_ec2"
#   }
# }

# Create Bastion host and Private Subnet here
# Make sure you have corrisponding Security groups