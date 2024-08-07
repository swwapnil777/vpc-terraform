terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.60.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# Creating a VPC
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-vpc"
  }
}

# Creating a private subnet
resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "private-subnet"
  }
}

# Creating a public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "public-subnet"
  }
}

# Creating an Internet Gateway
resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "my-igw"
  }
}

# Creating a public route table
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

# Creating a private route table
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "private-route-table"
  }
}

# Associating the public subnet with the public route table
resource "aws_route_table_association" "public-subnet-ass" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id      = aws_subnet.public-subnet.id
}

# Associating the private subnet with the private route table
resource "aws_route_table_association" "private-subnet-ass" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id      = aws_subnet.private-subnet.id
}
