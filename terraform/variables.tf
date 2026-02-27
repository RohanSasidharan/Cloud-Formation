variable "aws_region" {
            description = "AWS region for the deployment"
            type        = string
            default     = "eu-west-1"
        }

        variable "instance_type" {
            description = "EC2 instance"
            type        = string
            default     = "t3.micro"
        }

        variable "ami_id" {
            description = "Ubuntu server AMI ID eu-west-1"
            type        = string
            default     = "ami-03446a3af42c5e74e"
        }