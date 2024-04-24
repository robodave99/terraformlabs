resource "null_resource" "linux_provisioner" {
  count = var.nb_count

  depends_on = [
    azurerm_linux_virtual_machine.linux_vm
  ]

  provisioner "remote-exec" {
    inline = [
      "/usr/bin/hostname"
    ]
  }

  connection {
    type        = "ssh"
    user        = var.admin_username
    host        = element(azurerm_public_ip.linux_pip[*].fqdn, count.index + 1)
    private_key = file(var.private_key)
  }
}
