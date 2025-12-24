variable "vm_list" {
    description = "A map of virtual machines to be created"
    type = map(object({
        name     = string
        location = string
        resource_group_name = string
        network_interface_name = string
        admin_username = string
        admin_password = string
        computer_name = optional(string)
        vm_size                = string    
        nsg_key                 = string
        tags     = optional(map(string))
    }))
}

