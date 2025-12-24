variable "mssqlserver_list" {
  description = "Map of MSSQL Server configurations"
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
    tags                         = optional(map(string))
  }))
}