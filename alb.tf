# Application Load Balancer
resource "aws_lb" "web_alb" {
  name               = "web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]

  tags = {
    Name = "web-alb"
  }
}

# ALB Listener
resource "aws_lb_listener" "web_alb_listener" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_target_group.arn
  }
}

# Target Group
resource "aws_lb_target_group" "web_target_group" {
  name     = "web-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    protocol = "HTTP"
    port     = 80
    path     = "/"
  }

  tags = {
    Name = "web-target-group"
  }
}

# Listener Rule
resource "aws_lb_listener_rule" "web_alb_rule" {
  listener_arn = aws_lb_listener.web_alb_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_target_group.arn
  }

  condition {
    host_header {
      values = ["your-domain.com"]
    }
  }
}
