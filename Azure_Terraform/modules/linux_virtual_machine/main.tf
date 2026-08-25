resource "azurerm_linux_virtual_machine" "Linux_VM" {
  for_each                        = var.linux_virtula_machine
  name                            = each.value.name
  resource_group_name             = each.value.resource_group
  location                        = each.value.location
  size                            = each.value.VM_size
  disable_password_authentication = false
  admin_username                  = each.value.vm_username
  admin_password                  = each.value.passwd
  network_interface_ids           = [var.NIC_id[each.value.nic_id]]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  custom_data = base64encode(file("${path.module}/cloud-init.yaml"))
}