variable "rg_list" {
    description = "A map of resource groups to be created"
    type = map(object({
        name     = string
        location = string
        tags     = optional(map(string))
    }))
}