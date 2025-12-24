module "rg" {
  source = "../../custom/azurerm_rg"
  rg_list = var.rg_list
}
/*
module "sta" {
  source = "../../custom/azurerm_storage"
  sta_list = var.sta_list
}
*/
 
module "vnet" {
  depends_on = [module.rg]
  source = "../../custom/azurerm_vnet"
  vnet_list = var.vnet_list
}

module "subnet" {
  depends_on = [module.rg, module.vnet]
  source = "../../custom/azurerm_subnet"
  subnet_list = var.subnet_list
}
module "pip" {
  depends_on = [module.rg, module.subnet]
  source = "../../custom/azurerm_publicip"
  pip_list = var.pip_list
}
module "nic" {
  depends_on = [module.rg, module.subnet, module.pip]
  source = "../../custom/azurerm_nic"
  nic_list = var.nic_list
}

module "vm" {
  depends_on = [module.rg, module.subnet, module.nic, module.pip]
  source = "../../custom/azurerm_vm"
  vm_list = var.vm_list
}
 
 module "nsg" {
  depends_on = [module.rg, module.nic, module.vm]
  source = "../../custom/azurerm_nsg"
  vm_list  = var.vm_list
  nsg_list = var.nsg_list
  
 }
 
module "mssqlserver" {
  depends_on = [module.rg, module.subnet, module.nic, module.pip, module.vm]
  source = "../../custom/azurerm_mssqlserver"
  mssqlserver_list = var.mssqlserver_list
} 

module "mssqldatabase" {
  depends_on = [module.mssqlserver]
  source = "../../custom/azurerm_mssqldatabase"
  sqldatabase_list = var.sqldatabase_list
}
