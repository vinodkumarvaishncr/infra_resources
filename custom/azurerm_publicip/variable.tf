variable "pip_list" {
    description = "A map of public IPs to be created"
    type = map(object({
        name     = string
        location = string
        resource_group_name = string
        allocation_method = string  
         
        tags     = optional(map(string))
    }))
}
