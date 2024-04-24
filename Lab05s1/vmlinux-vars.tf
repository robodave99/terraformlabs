locals {
  common_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "n01610235@humber.ca"
    Environment  = "Lab"
  }
}

variable "vm_name" {
  default = "n01610235-u-vm"
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "admin_username" {
  default = "oladapo"
}

variable "public_key_path" {
  default = "/home/oladapo/.ssh/id_rsa.pub"
}

variable "private_key" {
  default = "/home/oladapo/.ssh/id_rsa"
}

variable "os_disk_storage_account_type" {
  default = "Premium_LRS"
}

variable "os_disk_size" {
  default = 32
}

variable "os_disk_caching" {
  default = "ReadWrite"
}

variable "ubuntu_os_publisher" {
  default = "Canonical"
}

variable "ubuntu_os_offer" {
  default = "UbuntuServer"
}

variable "ubuntu_os_sku" {
  default = "19.04"
}

variable "ubuntu_os_version" {
  default = "latest"
}

variable "linux_avs" {
  default = "linux_avs"
}

variable "nb_count" {
  default = 2
}