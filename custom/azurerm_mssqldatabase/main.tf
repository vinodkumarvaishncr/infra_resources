data "azurerm_mssql_server" "mssqlserver" {
   
  name                = "vinodmssqlserver"
  resource_group_name = "vinod_11"
}

output "id" {
  value = data.azurerm_mssql_server.mssqlserver.id
} 
resource "azurerm_mssql_database" "mssqldatabase" {
  for_each = var.sqldatabase_list
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.mssqlserver.id
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name  
  enclave_type = each.value.enclave_type
   
  tags     = try(each.value.tags, {})
}

