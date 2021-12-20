variable "region" {
  description = "name of region"
  default = "us-east-2"
}


variable "VPC-cidr" {
  description = "name of vpc cidr block"
  default = "10.0.0.0/16"
}

variable "cidr-subnet-pub1" {
  description = "public subnet 1"
  default = "10.0.1.0/24"
  
}

variable "cidr-subnet-pub2" {
  description = "public subnet 2"
  default = "10.0.2.0/24"
  
}

variable "cidr-subnet-private1" {
  description = "private subnet 1"
  default = "10.0.3.0/24"
  
}

variable "cidr-subnet-private2" {
  description = "private subnet 2"
  default = "10.0.4.0/24"
  
}