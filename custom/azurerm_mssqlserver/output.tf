data "azurerm_mssql_server" "mssqlserver" {
  for_each = azurerm_mssql_server.rgmssqlserver
  resource_group_name = each.value.resource_group_name
  name     = each.value.name
}


output "mssqlserver_ids" {
  description = "Map of Resource Group IDs"
  value = {
    for key, mssqlserver in data.azurerm_mssql_server.mssqlserver :
    key => {
        id = mssqlserver.id
        name = mssqlserver.name
        location = mssqlserver.location
    }
  }
}