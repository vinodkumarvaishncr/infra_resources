data "azurerm_public_ip" "pip" {
  for_each = azurerm_public_ip.pip
  name     = each.value.name
  resource_group_name = each.value.resource_group_name
} 

  
output "pip_ids" {
  description = "Map of Public IP IDs"
  value = {
    for key, pip in data.azurerm_public_ip.pip :
    key=>{
        id = pip.id
        name = pip.name
        location = pip.location
        
    }
  }
}