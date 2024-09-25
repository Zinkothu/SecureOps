
resource "aws_vpc" "main" {
  cidr_block       = "10.10.0.0/16"
  tags = {
    Name = "master-prod-vpc"
  }
}

################################################################################
# Publiс Subnets
###############################################################################

resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnets) #length will be base on the var.public_subnet subnet ammount current is 3
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets[count.index] #count.index is will call index number 0 then 1 and 2 
  availability_zone  =  data.aws_availability_zones.azs.names[count.index]
  map_public_ip_on_launch = true  #public ip assign

  tags = {
    Name = "public-subnet-0${count.index+1}-${data.aws_availability_zones.azs.names[count.index]}"
  }
}

################################################################################
# Private Subnets
###############################################################################

resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnets) #length will be base on the var.public_subnet subnet ammount current is 3
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnets[count.index] #count.index is will call index number 0 then 1 and 2 
  availability_zone  =  data.aws_availability_zones.azs.names[count.index]
  map_public_ip_on_launch = true  #public ip assign

  tags = {
    Name = "private-subnet-0${count.index+1}-${data.aws_availability_zones.azs.names[count.index]}"
  }
}

################################################################################
# DB Subnets
###############################################################################

resource "aws_subnet" "db_subnets" {
  count = length(var.db_subnets) #length will be base on the var.public_subnet subnet ammount current is 3
  vpc_id     = aws_vpc.main.id
  cidr_block = var.db_subnets[count.index] #count.index is will call index number 0 then 1 and 2 
  availability_zone  =  data.aws_availability_zones.azs.names[count.index]
  map_public_ip_on_launch = true  #public ip assign

  tags = {
    Name = "db-subnet-0${count.index+1}-${data.aws_availability_zones.azs.names[count.index]}"
  }
}

