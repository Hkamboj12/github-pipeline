resource "azurerm_subnet_nat_gateway_association" "NAT_SUB_association" {
  for_each       = var.NAT_SUB_assocation
  subnet_id      = var.subnet_id[each.value.subnet_id]
  nat_gateway_id = var.NAT_id[each.value.NAT_id]
}