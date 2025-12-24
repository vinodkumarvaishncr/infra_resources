# Get NICs
data "azurerm_network_interface" "nic" {
  for_each = var.vm_list

  name                = each.value.network_interface_name
  resource_group_name = each.value.resource_group_name
}

# Create NSGs
resource "azurerm_network_security_group" "vm_nsg" {
  for_each = var.nsg_list

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
    timeouts {
      create = "30m"
      update = "30m"
      delete = "30m"
    }
}

# Allow SSH
resource "azurerm_network_security_rule" "allow_ssh" {
  for_each = var.nsg_list

  name                        = "Allow-SSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = each.value.resource_group_name
  network_security_group_name = azurerm_network_security_group.vm_nsg[each.key].name
}

# Allow HTTP
resource "azurerm_network_security_rule" "allow_http" {
  for_each = var.nsg_list

  name                        = "Allow-HTTP"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = each.value.resource_group_name
  network_security_group_name = azurerm_network_security_group.vm_nsg[each.key].name
}

# Associate NSG with NIC
resource "azurerm_network_interface_security_group_association" "nic_nsg_association" {
  for_each = var.vm_list

  network_interface_id = data.azurerm_network_interface.nic[each.key].id

  network_security_group_id = azurerm_network_security_group.vm_nsg[each.value.nsg_key].id
}
