variable "linux_name" {
  default = "n01610235-u-vm1"
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