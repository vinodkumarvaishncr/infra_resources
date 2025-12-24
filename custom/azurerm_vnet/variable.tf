variable "vnet_list" {
    description = "A map of virtual networks to be created"
    type = map(object({
        name     = string
        location = string
        resource_group_name = string
        address_space = list(string)    
        tags     = optional(map(string))
    }))
}