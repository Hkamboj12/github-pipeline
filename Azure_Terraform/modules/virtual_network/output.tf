output "vnet_id" {
  value = {
    for key, vnet in azurerm_virtual_network.vNET :
    key => vnet.id
  }
}