variable "sta_list" {
    description = "A map of storage accounts to be created"
    type = map(object({
        name     = string
        rg_name  = string
        location = string
        account_tier = string
        account_replication_type = string
        tags     = optional(map(string))
    }))
}

