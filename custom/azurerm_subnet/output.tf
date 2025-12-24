/*
data "azurerm_subnet" "subnet" {
  for_each = azurerm_subnet.subnet
  name     = each.value.name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}


output "subnet_ids" {
  description = "Map of Subnet IDs"
  value = {
    for key, subnet in data.azurerm_subnet.subnet :
    key => {
        id = subnet.id
        name = subnet.name
        address_prefixes = subnet.address_prefixes

    }
  }
}
*/
output "subnet_ids" {
  description = "Map of subnet name to subnet ID"
  value = {
    for _, subnet in azurerm_subnet.subnet :
    subnet.name => subnet.id
  }
}