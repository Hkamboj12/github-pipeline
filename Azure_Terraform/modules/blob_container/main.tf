resource "azurerm_storage_container" "blob_container" {
    for_each = var.blob_container
  name = each.value.name
  storage_account_id = var.storage_id[each.value.storage_account_id]
  container_access_type =  each.value.container_access_type
}