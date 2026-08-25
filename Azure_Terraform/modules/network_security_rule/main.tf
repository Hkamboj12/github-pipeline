resource "azurerm_network_security_rule" "nsg_rules" {
  for_each                    = var.nsg_rule
  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port
  destination_port_range      = each.value.destination_port
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = each.value.resource_group
  network_security_group_name = var.nsg_name[each.value.nsg_name]
}