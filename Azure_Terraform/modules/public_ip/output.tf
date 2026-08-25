output "pip_id" {
  value = {
    for key, pip_id in azurerm_public_ip.public_ip :
    key => pip_id.id
  }
}