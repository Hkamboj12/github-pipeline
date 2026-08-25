resource "azurerm_storage_account" "storage_account" {
    for_each = var.storage_account_details
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group
  account_tier = each.value.account_tier
  access_tier = each.value.access_tier
  account_replication_type = each.value.acc_replication_type
}