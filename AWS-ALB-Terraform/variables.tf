variable "aws_region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "aws_access_key" {
  description = "AWS access key ID"
  default     = "Your Access key"
}

variable "aws_secret_key" {
  description = "AWS secret access key"
  default     = "Your secret access key"
}

variable "instance_count" {
  description = "Number of EC2 instances"
  default     = 2
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  default     = "ami-05a5bb48beb785bf1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for EC2 instances"
  default     = "RHEL9"
}

variable "private_key_path" {
  description = "Path to the private key file for SSH"
  default     = "/home/safu/RHEL9.pem"
}

variable "target_group_name" {
  description = "Name of the target group"
  default     = "my-target-group"
}

variable "target_group_port" {
  description = "Port for the target group"
  default     = 80
}

variable "target_group_protocol" {
  description = "Protocol for the target group"
  default     = "HTTP"
}

variable "vpc_id" {
  description = "VPC ID"
  default     = "vpc-040abbe7747cdc235"
}

variable "load_balancer_name" {
  description = "Name of the load balancer"
  default     = "my-load-balancer"
}

variable "internal_lb" {
  description = "Whether the load balancer is internal or not"
  default     = false
}

variable "lb_type" {
  description = "Type of the load balancer"
  default     = "application"
}

variable "lb_security_group" {
  description = "Security group ID for the load balancer"
  default     = "sg-008a0414790fde683"
}

variable "lb_subnets" {
  description = "List of subnet IDs for the load balancer"
  default     = ["subnet-09babc1516bb2c9b2", "subnet-0fbccfe3e40ccd3ca"]
}

variable "enable_deletion_protection" {
  description = "Whether deletion protection is enabled for the load balancer"
  default     = false
}

variable "lb_listener_port" {
  description = "Port for the load balancer listener"
  default     = 80
}

variable "lb_listener_protocol" {
  description = "Protocol for the load balancer listener"
  default     = "HTTP"
}

