output "NIC_id" {
  value = {
    for key, nic_id in azurerm_network_interface.NIC :
    key => nic_id.id
  }
}

output "NIC_private_ip" {
  value = {
    for key, nic_private_ip in azurerm_network_interface.NIC :
    key => nic_private_ip.private_ip_address
  }
}