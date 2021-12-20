# the load balancer

# APPLICATION LOAD BALANCER
# terraform create application load balancer

resource "aws_lb" "transcorp-alb" {
  name               = "transcorp-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Project6_Securitygroup.id]

  subnet_mapping {
    subnet_id = aws_subnet.Public-subnet1.id
  }

  subnet_mapping {
    subnet_id = aws_subnet.Public-subnet2.id
  }

  enable_deletion_protection = false

  tags = {
    name = "lb-transcorp"
  }
}

# Target Group #

resource "aws_alb_target_group" "transcorp_alb_target_group" {
  name        = "transcorp-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.MyVPC-MainProject.id

  health_check {
    healthy_threshold   = 5
    interval            = 30
    matcher             = "200,300"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
}

# LISTENER ON PORT 80 WITH REDIRECT APPLICATION

resource "aws_lb_listener" "transcorp-alb-listener" {
  load_balancer_arn = aws_lb.transcorp-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.transcorp_alb_target_group.arn
  }
}

