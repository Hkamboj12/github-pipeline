output "NAT_gateway" {
  value = {
    for key, nat_gateway in azurerm_nat_gateway.NAT :
    key => nat_gateway.id
  }
}