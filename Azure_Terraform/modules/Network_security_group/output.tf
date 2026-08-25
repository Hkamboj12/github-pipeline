output "nsg_name" {
  value = {
    for key, nsg_name in azurerm_network_security_group.nsg :
    key => nsg_name.name
  }
}

output "nsg_id" {
  value = {
    for key, nsg_id in azurerm_network_security_group.nsg :
    key => nsg_id.id
  }
}