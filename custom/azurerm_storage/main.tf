
resource "azurerm_storage_account" "sta" {

  for_each = var.sta_list
  name = each.value.name
  resource_group_name = each.value.rg_name
  account_tier = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  location = each.value.location
  tags     = try(each.value.tags, {})
}