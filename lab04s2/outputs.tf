output "linux_hostname" {
  value = azurerm_linux_virtual_machine.linux_vm[*].name
}

output "linux_FQDN" {
  value = azurerm_public_ip.linux_pip[*].fqdn
}

output "linux_private_ip_address" {
  value = azurerm_network_interface.linux-nic[*].private_ip_address
}

output "linux_public_ip_address" {
  value = azurerm_linux_virtual_machine.linux_vm[*].public_ip_address
}

output "virtual_network_name" {
  value = azurerm_virtual_network.network_vnet.name
}

output "address_space" {
  value = azurerm_virtual_network.network_vnet.address_space
}

output "subnet1_name" {
  value = azurerm_subnet.network_subnet1.name
}

output "subnet1_address" {
  value = azurerm_subnet.network_subnet1.address_prefixes
}

output "subnet2_name" {
  value = azurerm_subnet.network_subnet2.name
}

output "subnet2_address" {
  value = azurerm_subnet.network_subnet2.address_prefixes
}

output "linux_availability_set" {
  value = azurerm_availability_set.linux_avs.name
}

output "windows_availability_set" {
  value = azurerm_availability_set.windows_avs.name
}

output "windows_hostnames" {
  value = values(azurerm_windows_virtual_machine.windows-vm)[*].name
}

output "windows_FQDN" {
  value = values(azurerm_public_ip.windows-pip)[*].fqdn
}

output "windows_private_ip_address" {
  value = values(azurerm_windows_virtual_machine.windows-vm)[*].private_ip_address
}

output "windows_public_ip_address" {
  value = values(azurerm_windows_virtual_machine.windows-vm)[*].public_ip_address
}