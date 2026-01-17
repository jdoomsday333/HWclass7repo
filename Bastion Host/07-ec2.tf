resource "aws_instance" "thailand_public" {
  ami                         = "ami-0b9a325ab140afeee"
  associate_public_ip_address = true
  instance_type               = "t3.micro"
  key_name = "Thaikp"
  # Select security group you will use Private/Public/LB/BastionHost
  vpc_security_group_ids = [aws_security_group.thailand_bastion_sg.id]
  subnet_id              = aws_subnet.public-ap-southeast-7a.id

  user_data = filebase64("user_data.sh")

  tags = {
    Name = "BastionHost"
  }
}

#Create Bastion host and Private Subnet here
#Make sure you have corrisponding Security groups

resource "aws_instance" "thailand_private" {
  ami                         = "ami-0b9a325ab140afeee"
  associate_public_ip_address = true
  instance_type               = "t3.micro"
  key_name = "Thaikp"
  # Select security group you will use Private/Public/LB/BastionHost
  vpc_security_group_ids = [aws_security_group.thailand_private_sg.id]
  subnet_id              = aws_subnet.private-ap-southeast-7a.id

  user_data = filebase64("user_data.sh")

  tags = {
    Name = "PrivateEC2"
  }
}