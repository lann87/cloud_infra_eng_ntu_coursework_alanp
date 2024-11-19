# Input variables for VPC module
 variable "vpc_cidr" {
   description  = "cidr block of vpc"
   type         = string
   default      = "10.0.0.0/16"
 }

 variable "vpc_name" {
   description  = "name of vpc"
   type         = string
   default      = "alanp-vpc"
 }

 variable "public_subnet_1a_cidr" {
   description  = "subnet 1a cidr block"
   type         = string
 }

 variable "public_subnet_1b_cidr" {
   description  = "subnet 1b cidr block"
   type         = string
 }

 variable "public_subnet_1c_cidr" {
   description  = "subnet 1c cidr block"
   type         = string
 }

  variable "private_subnet_1a_cidr" {
   description  = "subnet 1a cidr block"
   type         = string
 }

 variable "private_subnet_1b_cidr" {
   description  = "subnet 1b cidr block"
   type         = string
 }

 variable "private_subnet_1c_cidr" {
   description  = "subnet 1c cidr block"
   type         = string
 }