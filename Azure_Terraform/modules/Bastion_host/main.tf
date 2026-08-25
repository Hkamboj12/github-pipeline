resource "azurerm_bastion_host" "HUB_Bastion" {
  for_each            = var.bastion_host
  name                = each.value.name
  location            = each.value.loaction
  resource_group_name = each.value.resource_group

  ip_configuration {
    name                 = each.value.config_name
    subnet_id            = var.subnet_id[each.value.subnet_name]
    public_ip_address_id = var.public_ip_id[each.value.public_ip]
  }
}