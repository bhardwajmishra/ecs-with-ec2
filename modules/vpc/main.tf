#VPC
resource "aws_vpc" "main" {
  cidr_block = var.cidr_vpc
  tags = {
    Name = "tf-vpc1"
  }
}

#Subnet 
resource "aws_subnet" "main_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_for_subnet_a
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-sn-11"
  }
}

resource "aws_subnet" "main_b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_for_subnet_b
  availability_zone = "us-east-1b"

  tags = {
    Name = "tf-sn-21"
  }
}

resource "aws_subnet" "main_c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_for_subnet_c
  availability_zone = "us-east-1c"

  tags = {
    Name = "tf-sn-31"
  }
}

#Route Table 
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.cidr_vpc
    gateway_id = "local"
  }

  tags = {
    Name = "tf-rt1"
  }
}
resource "aws_route_table_association" "main_a" {
  subnet_id      = aws_subnet.main_a.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "main_b" {
  subnet_id      = aws_subnet.main_b.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "main_c" {
  subnet_id      = aws_subnet.main_c.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route" "main" {
  route_table_id         = aws_route_table.main.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

#IGW
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "bhardwaj1"
  }
}






