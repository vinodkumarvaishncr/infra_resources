variable "nic_list" {
    description = "A map of network interfaces to be created"
    type = map(object({
        name     = string
        location = string
        resource_group_name = string
        ip_configuration = object({
            name                          = string
            subnet_name                   = string
            virtual_network_name =         optional(string)
            private_ip_address_allocation = string
            public_ip_name                = string
        })
        tags     = optional(map(string))
    }))
}
