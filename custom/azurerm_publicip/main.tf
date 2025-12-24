
resource "azurerm_public_ip" "pip" {
 
  for_each = var.pip_list
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method = each.value.allocation_method
  sku = "Standard"
  tags = lookup(each.value, "tags", {})
   
}