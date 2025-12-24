variable "nsg_list" {
  description = "A map of Network Security Groups to create"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
  }))
}
variable "vm_list" {
  description = "List of VMs and their NIC details"
  type = map(object({
    name                    = string
    location                = string
    resource_group_name     = string
    network_interface_name  = string
    nsg_key                 = string
  }))
}