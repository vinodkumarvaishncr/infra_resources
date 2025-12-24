data "azurerm_resource_group" "rg" {
  for_each = azurerm_resource_group.rg
  name     = each.value.name
}


output "rg_ids" {
  description = "Map of Resource Group IDs"
  value = {
    for key, rg in data.azurerm_resource_group.rg :
    //key => rg.id
    key=>{
        id = rg.id
        name = rg.name
        location = rg.location
        
    }
  }
}