terraform {
                required_providers {
                  aws = {
                    source  = "hashicorp/aws"
                    version = "~> 6.0"
                  }
                }
                required_version = ">= 1.5.0"
              }

        
            provider "aws" {
                region = var.aws_region
            }         
        
        
            resource "aws_key_pair" "devops_key" {
                key_name   = "terraformkey"
                public_key = file("${path.module}/terraformkey.pub")
            }
           
        
       
            resource "aws_security_group" "web_sg" {
                  name        = "terraformkey-secgrp"
                  description = "Allows the HTTPS and SSH portsd"

                  ingress {
                    description = "Access the SSH"
                    from_port   = 22
                    to_port     = 22
                    protocol    = "tcp"
                    cidr_blocks = ["0.0.0.0/0"]
                  }

                  ingress {
                    description = "Access the HTTP"
                    from_port   = 80
                    to_port     = 80
                    protocol    = "tcp"
                    cidr_blocks = ["0.0.0.0/0"]
                 }

                  egress {
                    description = "Allow all the outbound"
                    from_port   = 0
                    to_port     = 0
                    protocol    = "-1"
                   cidr_blocks = ["0.0.0.0/0"]
                  }

                  tags = {
                    Name = "terraformkey-secgrp"
                  }
                }

            resource "aws_instance" "web" {
              ami                    = var.ami_id
              instance_type          = var.instance_type
              key_name               = aws_key_pair.devops_key.key_name
              vpc_security_group_ids = [aws_security_group.web_sg.id]

              tags = {
                Name = "CloudAutomation"
              }
            }