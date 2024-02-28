provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}


resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "web-${count.index}"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "echo '<html><body><h1>Hello from instance ${count.index + 1}</h1></body></html>' | sudo tee /var/www/html/index.html",
      "sudo systemctl restart httpd"
    ]
  }
}

resource "aws_lb_target_group" "target_group" {
  name     = var.target_group_name
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "target_group_attachment" {
  count            = var.instance_count
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.web[count.index].id
  port             = var.target_group_port
}

resource "aws_lb" "load_balancer" {
  name               = var.load_balancer_name
  internal           = var.internal_lb
  load_balancer_type = var.lb_type
  security_groups    = [var.lb_security_group]
  subnets            = var.lb_subnets

  enable_deletion_protection = var.enable_deletion_protection

  tags = {
    Name = var.load_balancer_name
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = var.lb_listener_port
  protocol          = var.lb_listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

