resource "azurerm_virtual_network_peering" "example-1" {
  for_each                     = var.vnet_peering
  name                         = each.value.name
  resource_group_name          = each.value.resource_group
  virtual_network_name         = each.value.vnet_name
  remote_virtual_network_id    = var.vnet[each.value.remote_virtual_id]
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

}