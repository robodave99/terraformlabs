variable "resource_group_name" {
  type    = string
  default = "network-rg"
}

variable "location" {
  type    = string
  default = "Canada Central"
}

variable "virtual_network_name" {
  type    = string
  default = "network-vnet"
}

variable "virtual_network_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet1_name" {
  type    = string
  default = "network-subnet1"
}

variable "subnet2_name" {
  type    = string
  default = "network-subnet2"
}

variable "subnet1_address" {
  type    = list(string)
  default = ["10.0.0.0/24"]
}

variable "subnet2_address" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "network_security_group1_name" {
  type    = string
  default = "network-nsg1"
}

variable "network_security_group2_name" {
  type    = string
  default = "network-nsg2"
}