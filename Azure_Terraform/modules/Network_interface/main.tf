resource "azurerm_network_interface" "NIC" {
  for_each            = var.nic_details
  name                = each.value.name
  resource_group_name = each.value.resource_group
  location            = each.value.location

  ip_configuration {
    name                          = each.value.config_name
    subnet_id                     = var.subnet_id[each.value.subnet_id]
    private_ip_address_allocation = each.value.allocation_type
    #public_ip_address_id = ""
  }
}