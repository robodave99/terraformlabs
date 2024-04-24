resource "azurerm_network_interface" "windows-nic" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  location            = azurerm_resource_group.network_rg.location
  resource_group_name = azurerm_resource_group.network_rg.name
  tags                = local.common_tags

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = azurerm_subnet.network_subnet2.id
    public_ip_address_id          = azurerm_public_ip.windows-pip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "windows-pip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  resource_group_name = azurerm_resource_group.network_rg.name
  location            = azurerm_resource_group.network_rg.location
  allocation_method   = "Dynamic"
  domain_name_label   = each.key
  tags                = local.common_tags
}

resource "azurerm_windows_virtual_machine" "windows-vm" {
  for_each            = var.windows_name
  name                = each.key
  resource_group_name = azurerm_resource_group.network_rg.name
  location            = azurerm_resource_group.network_rg.location
  size                = each.value
  admin_username      = var.windows_admin_username
  admin_password      = var.windows_admin_password
  tags                = local.common_tags

  network_interface_ids = [
    azurerm_network_interface.windows-nic[each.key].id,
  ]

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.windows_os_disk_caching
    storage_account_type = var.windows_os_disk_storage_account_type
    disk_size_gb         = var.windows_os_disk_size
  }

  source_image_reference {
    publisher = var.windows_os_publisher
    offer     = var.windows_os_offer
    sku       = var.windows_os_sku
    version   = var.windows_os_version
  }

  winrm_listener {
    protocol = "Http"
  }
}

resource "azurerm_availability_set" "windows_avs" {
  name                         = var.windows_avs
  location                     = azurerm_resource_group.network_rg.location
  resource_group_name          = azurerm_resource_group.network_rg.name
  platform_update_domain_count = 5
  platform_fault_domain_count  = 2
}
