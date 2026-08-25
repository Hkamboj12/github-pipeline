resource "azurerm_subnet" "subnet" {
  for_each             = var.subnet_details
  name                 = each.value.name
  resource_group_name  = each.value.resource_group
  virtual_network_name = each.value.virtual_network
  address_prefixes     = each.value.address_prefix
}