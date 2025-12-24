data "azurerm_storage_account" "sta" {
  for_each = azurerm_storage_account.sta
  name     = each.value.name
  resource_group_name = each.value.resource_group_name
}


output "sta_ids" {
  description = "Map of Storage Account IDs"
  value = {
    for key, sta in data.azurerm_storage_account.sta :
    //key => rg.id
    key=>{
        id = sta.id
        name = sta.name
        location = sta.location
        resource_group_name = sta.resource_group_name
        
    }
  }
}