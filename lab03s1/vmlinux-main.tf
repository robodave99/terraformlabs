resource "azurerm_network_interface" "linux-nic" {
  name = "${var.linux_name}-nic"
  location = var.location
  resource_group_name = var.resource_group_name
  tags = local.common_tags

  ip_configuration {
    name = "${var.linux_name}-ipconfig"
    subnet_id = azurerm_subnet.network_subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "linux_pip" {
  name                = "${var.linux_name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label   = var.linux_name
  tags                = local.common_tags
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                = var.linux_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  tags                = local.common_tags
  network_interface_ids = [
    azurerm_network_interface.linux-nic.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key_path)
  }

  os_disk {
    name                 = "${var.linux_name}-os-disk"
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
    disk_size_gb         = var.os_disk_size
  }

  source_image_reference {
    publisher = var.ubuntu_os_publisher
    offer     = var.ubuntu_os_offer
    sku       = var.ubuntu_os_sku
    version   = var.ubuntu_os_version
  }
}