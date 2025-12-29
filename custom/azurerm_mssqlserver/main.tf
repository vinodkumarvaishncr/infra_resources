
# Reference to existing Key Vault
data "azurerm_key_vault" "mssqlkeyvault" {
  name                = "vinodkeyvault22"
  resource_group_name = "vinod_main_rg"
}
# Read a secret mssql username
data "azurerm_key_vault_secret" "mssql_username" {
  name         = "mssql-username"
  key_vault_id = data.azurerm_key_vault.mssqlkeyvault.id
}

# Read a secret mssql password
data "azurerm_key_vault_secret" "mssql_password" {
  name         = "mssql-password"
  key_vault_id = data.azurerm_key_vault.mssqlkeyvault.id
}

resource "azurerm_mssql_server" "rgmssqlserver" {
   for_each = var.mssqlserver_list
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = data.azurerm_key_vault_secret.mssql_username.value
  administrator_login_password = data.azurerm_key_vault_secret.mssql_password.value
  minimum_tls_version          = each.value.minimum_tls_version
  
  tags     = try(each.value.tags, {})
}

