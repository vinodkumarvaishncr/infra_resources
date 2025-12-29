
data "azurerm_network_interface" "nic" {
  for_each = var.vm_list
  name                = each.value.network_interface_name
  resource_group_name = each.value.resource_group_name
}

# Reference to existing Key Vault
data "azurerm_key_vault" "keyvault" {
  name                = "vinodkeyvault22"
  resource_group_name = "vinod_main_rg"
}
# Read a secret vm username
data "azurerm_key_vault_secret" "vm_username" {
  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

# Read a secret vm password
data "azurerm_key_vault_secret" "vm_password" {
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

resource "azurerm_virtual_machine" "vm" {

  for_each = var.vm_list
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  
  vm_size = each.value.vm_size

  network_interface_ids = [data.azurerm_network_interface.nic[each.key].id]
  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
  delete_os_disk_on_termination = true
  storage_os_disk {
    name              = "${each.value.name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = each.value.computer_name
    //admin_username = each.value.admin_username
    //admin_password = each.value.admin_password
    admin_username = data.azurerm_key_vault_secret.vm_username.value
    admin_password = data.azurerm_key_vault_secret.vm_password.value
    # 🔥 THIS IS THE KEY PART
      custom_data    = base64encode(
        file("${path.module}/../scripts/install-nginx.sh")
      )
  }
  os_profile_linux_config {
    disable_password_authentication =   false
  }
  
   
  tags     = try(each.value.tags, {})
}

