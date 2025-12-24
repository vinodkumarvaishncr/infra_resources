
resource "azurerm_network_interface" "nic" {
 
  for_each = var.nic_list
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  tags = lookup(each.value, "tags", {})
  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id = data.azurerm_subnet.selected[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
  }
}