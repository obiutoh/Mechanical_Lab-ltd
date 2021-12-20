# The VPC 

resource "aws_vpc" "MyVPC-MainProject" {
  cidr_block            = var.VPC-cidr
  instance_tenancy      = "default"
  enable_dns_hostnames =  true

  tags = {
    Name               = "MyVPC-MainProject"
  }
}


# Pblic Subnet_1

resource "aws_subnet" "Public-subnet1" {
  vpc_id     = aws_vpc.MyVPC-MainProject.id
  cidr_block = var.cidr-subnet-pub1

  availability_zone = "us-east-2b"

  tags = {
    Name = "Public-subnet1"
  }
}


# Public Subnet_2

resource "aws_subnet" "Public-subnet2" {
  vpc_id     = aws_vpc.MyVPC-MainProject.id
  cidr_block = var.cidr-subnet-pub2

  availability_zone = "us-east-2a"

  tags = {
    Name = "Public-subnet2"
  }
}


# The Private_Subnet1

resource "aws_subnet" "Private-subnet1" {
  vpc_id     = aws_vpc.MyVPC-MainProject.id
  cidr_block = var.cidr-subnet-private1

  availability_zone = "us-east-2b"

  tags = {
    Name = "Private-subnet1"
  }
}


# The Private_Subnet2

resource "aws_subnet" "Private-subnet2" {
  vpc_id     = aws_vpc.MyVPC-MainProject.id
  cidr_block = var.cidr-subnet-private2

  availability_zone = "us-east-2a"

  tags = {
    Name = "Private-subnet2"
  }
}

# Route Table Public

resource "aws_route_table" "Public-Routetable" {
  vpc_id = aws_vpc.MyVPC-MainProject.id



  tags = {
    Name = "Public-Routetable"
  }
}


#  Route_Table Private

resource "aws_route_table" "Private-Routetable" {
  vpc_id = aws_vpc.MyVPC-MainProject.id



  tags = {
    Name = "Private-Routetable"
  }
}


# The Public_subnet Association with Route1

resource "aws_route_table_association" "Public-Subnass" {
  subnet_id      = aws_subnet.Public-subnet1.id
  route_table_id = aws_route_table.Public-Routetable.id
}


# The Public_subnet Association with Route2

resource "aws_route_table_association" "Public-Subnetass2" {
  subnet_id      = aws_subnet.Public-subnet2.id
  route_table_id = aws_route_table.Public-Routetable.id
}



# The Private_subnet Association with Route1

resource "aws_route_table_association" "Private-Routetableas" {
  subnet_id      = aws_subnet.Private-subnet1.id
  route_table_id = aws_route_table.Private-Routetable.id
}

# The Private_subnet Association with Route2

resource "aws_route_table_association" "Private-Subnetaso2" {
  subnet_id      = aws_subnet.Private-subnet2.id
  route_table_id = aws_route_table.Private-Routetable.id
}



# The_Internet Gateway 


resource "aws_internet_gateway" "Project6-gateway" {
  vpc_id       = aws_vpc.MyVPC-MainProject.id

  tags = {
    Name       = "Project6-gateway"
  }
}


# Connect of Routable and Internet Gate Way

# Conection of Route to Internet GW And Pub-Route


resource "aws_route" "Connection-igwroute" {
  route_table_id            = aws_route_table.Public-Routetable.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.Project6-gateway.id               
} 


