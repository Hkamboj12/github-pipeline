output "subnet_id" {
  value = {
    for key, sub_id in azurerm_subnet.subnet :
    key => sub_id.id
  }
}