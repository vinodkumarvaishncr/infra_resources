 /*
 data "azurerm_public_ip" "pip" {
  for_each = var.nic_list

  name                = each.value.ip_configuration.public_ip_name
  resource_group_name = each.value.resource_group_name
}
*/