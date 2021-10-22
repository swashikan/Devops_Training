resource "aws_vpc" "global_vpc" {
  cidr_block = var.vpcip
  tags = var.networktag
}

resource "aws_subnet" "global_public" {
  cidr_block = var.public_subnet
  vpc_id     = aws_vpc.global_vpc.id
}

resource "aws_subnet" "global_private" {
  cidr_block = var.private_subnet
  vpc_id     = aws_vpc.global_vpc.id
}

resource "aws_internet_gateway" "global_igw" {
  vpc_id = aws_vpc.global_vpc.id
  tags = var.networktag
}

resource "aws_route_table" "global_public_table" {
  vpc_id = aws_vpc.global_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.global_igw.id
  }
}

resource "aws_route_table_association" "global_public_asso" {
  route_table_id = aws_route_table.global_public_table.id
  subnet_id = aws_subnet.global_public.id
}

resource "aws_eip" "global_eip" {
  vpc = true
}

resource "aws_nat_gateway" "global_ngw" {
  subnet_id = aws_subnet.global_private.id
  allocation_id = aws_eip.global_eip.id
}

resource "aws_route_table" "global_private_route" {
  vpc_id = aws_vpc.global_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.global_ngw.id
  }
}

resource "aws_route_table_association" "global_private_acco" {
  route_table_id = aws_route_table.global_private_route.id
  subnet_id = aws_subnet.global_private.id
}