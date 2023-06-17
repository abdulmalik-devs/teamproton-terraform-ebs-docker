# Creating VPC, Name, CIDR amd Tags
resource "aws_vpc" "prod_vpc" {
  cidr_block                = "10.0.0.0/16"
  instance_tenancy          = "default"
  enable_dns_hostnames      = "true"
  enable_dns_support        = "true"
  enable_classiclink        = "false"

  tags = {
    Name = "${var.vpc_name}"
  }
}

# Creating Public Subnet in VPC
resource "aws_subnet" "public_subnet" {
  vpc_id                    = aws_vpc.prod_vpc.id
  cidr_block                = "10.0.1.0/24"
  map_public_ip_on_launch   = "true"
  availability_zone         = "us-east-1a"

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                    = aws_vpc.prod_vpc.id
  cidr_block                = "10.0.2.0/24"
  map_public_ip_on_launch   = "false"
  availability_zone         = "us-east-1b"

  tags = {
    Name = "private_subnet"
  }
}

# Creating Internet Gateway in AWS VPC
resource "aws_internet_gateway" "igw" {
  vpc_id  = aws_vpc.prod_vpc.id

  tags = {
    Name  = "prod_igw"
  }
}

# Creating Route Tables for Internet gateway
resource "aws_route_table" "route-igw" {
  vpc_id            = aws_vpc.prod_vpc.id
  route {
    cidr_block      = "0.0.0.0/0"
    gateway_id      = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Route-IGW"
  }
}

# Creating Route Associations public subnets
resource "aws_route_table_association" "route_public" {
  subnet_id          = aws_subnet.public_subnet.id
  route_table_id     = aws_route_table.route-igw.id
}


# Creating route associations for private Subnets
resource "aws_route_table_association" "route_private" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.route-nat.id
}

# Creating Nat Gateway
resource "aws_eip" "nat" {
  vpc = true
}

# Attachning Nat Gateway to Public Subnet
resource "aws_nat_gateway" "nat-igw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.private_subnet.id
  depends_on    = [aws_internet_gateway.igw]
}

# Add routes for private subnet
resource "aws_route_table" "route-nat" {
  vpc_id = aws_vpc.prod_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-igw.id
  }
  tags = {
    Name = "route-nat"
  }
}


