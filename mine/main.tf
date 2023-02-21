provider "aws" {
  region     = "us-east-1"
  access_key = "<access-key>"
  secret_key = "<secret-key>"
}

# resource "aws_instance" "ec2-instance" {
#   ami           = "ami-0dfcb1ef8550277af"
#   instance_type = "t2.micro"
#   tags = {
#     Name = "ハローハッピーワールド！！！"
#   }
# }

resource "aws_vpc" "first-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "Production"
  }
}

resource "aws_vpc" "second-vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    "Name" = "Development"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.first-vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    "Name" = "Subnet-Prod"
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id     = aws_vpc.second-vpc.id
  cidr_block = "10.1.1.0/24"
  tags = {
    "Name" = "Subnet-Development"
  }
}

