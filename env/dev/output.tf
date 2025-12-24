output "rg_ids" {
  description = "RG details from RG module"
  value       = module.rg.rg_ids
}
/*
output "sta_ids" {
  description = "Storage Account details from Storage Account module"
  value       = module.sta.sta_ids
}
*/
 
output "vnet_ids" {
  description = "VNet details from VNet module"
  value       = module.vnet.vnet_ids
}
output "subnet_ids" {
  description = "Subnet details from Subnet module"
  value       = module.subnet.subnet_ids
}

output "nic_ids" {
  description = "NIC details from NIC module"
  value       = module.nic.nic_ids
}

output "pip_ids" {
  description = "Public IP details from Public IP module"
  value       = module.pip.pip_ids
}

output "mssqlserver_ids" {
  description = "MSSQL Server details from MSSQL Server module"
  value       = module.mssqlserver.mssqlserver_ids
}
 
 
