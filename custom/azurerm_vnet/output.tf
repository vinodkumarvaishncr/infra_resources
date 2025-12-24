data "azurerm_virtual_network" "vnet" {
  for_each = azurerm_virtual_network.vnet
  name     = each.value.name
  resource_group_name = each.value.resource_group_name
}


output "vnet_ids" {
  description = "Map of Virtual Network IDs"
  value = {
    for key, vnet in data.azurerm_virtual_network.vnet :
    key=>{
        id = vnet.id
        name = vnet.name
        address_space = vnet.address_space
    }
  }
}