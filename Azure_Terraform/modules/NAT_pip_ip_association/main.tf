resource "azurerm_nat_gateway_public_ip_association" "NAT_public_ip_association" {
  for_each             = var.NAT_pub_ip_associt
  nat_gateway_id       = var.nat_gateway_id[each.value.nat_id]
  public_ip_address_id = var.public_ip_id[each.value.public_ip_id]
}