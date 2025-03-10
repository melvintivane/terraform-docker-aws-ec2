terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "allow_http" {
  name = "allow_http"
  description = "Permitir acesso http e acesso a internet"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "keypair" {
  key_name = "terraform-keypair"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "servidor" {
  ami           = "ami-05b10e08d247fb927"
  instance_type = "t2.nano"
  user_data     = file("user_data.sh")
  key_name = aws_key_pair.keypair.key_name
  vpc_security_group_ids = [aws_security_group.allow_http.id]
}