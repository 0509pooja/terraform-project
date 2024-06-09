# EC2 Instances
resource "aws_instance" "web_instance" {
  ami             = "ami-0cf2b4e024cdb6960"  # Replace with your preferred AMI for web server
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.private_subnet_1.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name        = "oregon"
  user_data = file("setup_web_app.sh")

  tags = {
    Name = "web_instance"
  }
}

# EC2 Instances
resource "aws_instance" "db_instance" {
  ami             = "ami-0cf2b4e024cdb6960"  # Replace with your preferred AMI for web server
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.private_subnet_2.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name        = "oregon"
  user_data = file("setup_postgres.sh")
  

  tags = {
    Name = "db_instance"
  }
}

resource "aws_instance" "bastion" {
  ami           = "ami-0cf2b4e024cdb6960"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet_1.id
  security_groups = [aws_security_group.bastion_sg.id]
  key_name        = "oregon"
  user_data = file("setup_bastion.sh")

  tags = {
    Name = "bastion"
  }

  #  public IP is assigned to the instance
  associate_public_ip_address = true
}

# Elastic IP for Bastion host
resource "aws_eip" "bastion_eip" {
  instance = aws_instance.bastion.id
}
