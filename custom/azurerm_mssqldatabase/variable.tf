variable "sqldatabase_list" {
    description = "A map of MSSQL Databases to be created"
    type = map(object({
        name         = string
        server_id    = string
        max_size_gb  = number
        sku_name     = string
        enclave_type = string
        tags         = optional(map(string))
    }))
}