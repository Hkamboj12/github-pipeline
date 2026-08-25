resource "azurerm_nat_gateway" "NAT" {
  for_each            = var.NAT_gateway
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group
  sku_name            = "Standard"
}