resource "azurerm_public_ip" "public_ip" {
  for_each            = var.public_ip
  name                = each.value.name
  resource_group_name = each.value.resource_group
  location            = each.value.location
  allocation_method   = "Static"
  sku                 = each.value.sku
}