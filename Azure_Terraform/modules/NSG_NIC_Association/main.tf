resource "azurerm_network_interface_security_group_association" "NIC_nsg" {
  for_each                  = var.nic_nsg_assocation
  network_interface_id      = var.NIC_id[each.value.nic_name]
  network_security_group_id = var.nsg_id[each.value.nsg_name]
}