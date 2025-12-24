 locals {
  rg_key =keys(var.rg_list)
  rg_value=values(var.rg_list)
  rg_tags=values(var.rg_list)
}
resource "azurerm_resource_group" "rg" {
 
  for_each = var.rg_list
  name = each.value.name
  location = each.value.location
  tags     = try(each.value.tags, {})
}