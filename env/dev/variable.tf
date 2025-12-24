variable "rg_list" {
    description = "A map of resource groups to be created"
    type = map(object({
        name     = string
        location = string
        tags     = optional(map(string))
    }))
}
/*
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
*/
 
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

variable "subnet_list" {
    description = "A map of subnets to be created"
    type = map(object({
        name     = string
        resource_group_name = string
        virtual_network_name = string
        address_prefixes = list(string) 
        tags     = optional(map(string))
    }))
}

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

variable "nsg_list" {
  description = "A map of Network Security Groups to create"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
  }))
}
 
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