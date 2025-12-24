data "azurerm_network_interface" "nic" {
  for_each = azurerm_network_interface.nic
  name     = each.value.name
  resource_group_name = each.value.resource_group_name
}


output "nic_ids" {
  description = "Map of Network Interface IDs"
  value = {
    for key, nic in data.azurerm_network_interface.nic :
    key=>{
        id = nic.id
        name = nic.name
        location = nic.location
        
    }
  }
}