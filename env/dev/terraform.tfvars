rg_list ={
    "rg1" = {
        name     = "vinod_11"
        location = "canadacentral"
        tags     = {
            environment = "dev"
            owner       = "vinod"
        }
    },
    "rg2" = {
        name     = "vinod_22"
        location = "canadacentral"
         
    }
}
/*
sta_list ={
    "st1" = {
        name = "vinodsta1"
        rg_name     = "vinod_11"
        location = "canadacentral"
        account_tier = "Standard"
        account_replication_type = "LRS"
        tags     = {
            environment = "dev"
            owner       = "vinod"
        }
    },
    "st2" = {
        name = "vinodsta22"
        rg_name = "vinod_22"
        account_tier = "Standard"  
        account_replication_type = "LRS"
        location = "canadacentral"
         
    }
}
*/
vnet_list = {
    "vnet1" = {
        name = "vinodvnet1"
        resource_group_name     = "vinod_11"
        location = "canadacentral"
        address_space = ["10.0.0.0/16"] 
    },
    "vnet2" = {
        name = "vinodvnet2"
        resource_group_name = "vinod_22"
        location = "canadacentral"
        address_space = ["10.1.0.0/16"]
    }
}

subnet_list ={
    "subnet1" = {
        name = "vinodsubnet1"
        resource_group_name = "vinod_11"
        virtual_network_name = "vinodvnet1"
        address_prefixes = ["10.0.1.0/28"]
    },
    "subnet2" = {
        name = "vinodsubnet2"
        resource_group_name = "vinod_22"
        virtual_network_name = "vinodvnet2"
        address_prefixes = ["10.1.1.0/28"]
    }
}

nic_list = {
    "nic1" = {
        name = "vinodnic1"
        location = "canadacentral"
        resource_group_name = "vinod_11"
        ip_configuration = {
            name = "vinodipconfig1"
            subnet_name                  = "vinodsubnet1"
            virtual_network_name         = "vinodvnet1"
            private_ip_address_allocation = "Dynamic"
            public_ip_name                = "vinodpip1"
        }
        tags = {
            environment = "dev"
            owner       = "vinod"
        }
    },
    "nic2" = {
        name = "vinodnic2"
        location = "canadacentral"
        resource_group_name = "vinod_22"
        ip_configuration = {
            name = "vinodipconfig2"
            subnet_name                  = "vinodsubnet2"
            virtual_network_name         = "vinodvnet2"
            private_ip_address_allocation = "Dynamic"
            public_ip_name                = "vinodpip2"
        }
    }
}

pip_list = {
    "pip1" = {
        name = "vinodpip1"
        location = "canadacentral"
        resource_group_name = "vinod_11"
        allocation_method = "Static"
        sku = "Standard"
        tags = {
            environment = "dev"
            owner       = "vinod"
        }
    },
    "pip2" = {
        name = "vinodpip2"
        location = "canadacentral"
        resource_group_name = "vinod_22"
        sku = "Standard"
        allocation_method = "Static"
    }
}

vm_list = {
    "vm1" = {
        name = "vinodvm1"
        location = "canadacentral"
        resource_group_name = "vinod_11"
        network_interface_name = "vinodnic1"
        computer_name  = "vinodvm1"
        vm_size = "Standard_D2ls_v5"
        admin_username = ""   
        admin_password = ""
        nsg_key                 = "nsg1"         

        tags = {
            environment = "dev"
            owner       = "vinod"
        }
    },
    "vm2" = {
        name = "vinodvm2"
        location = "canadacentral"
        resource_group_name = "vinod_22"
        network_interface_name = "vinodnic2"
        vm_size = "Standard_D2ls_v5"
        computer_name  = "vinodvm2"
        admin_username = ""   
        admin_password = ""
        nsg_key                 = "nsg2"  
    }
     
}

nsg_list = {
    "nsg1" = {
        name = "vinodnsg1"
        resource_group_name = "vinod_11"
        location = "canadacentral"
    },
    "nsg2" = {
        name = "vinodnsg2"
        resource_group_name = "vinod_22"
        location = "canadacentral"
    }
}

mssqlserver_list = {
    "mssql1" = {
        name                         = "vinodmssqlserver"
        resource_group_name          = "vinod_11"
        location                     = "canadacentral"
        version                      = "12.0"
        administrator_login          = ""
        administrator_login_password = ""
        minimum_tls_version          = "1.2"
        tags = {
            environment = "dev"
            owner       = "vinod"
        }
    }
    
} 

sqldatabase_list = {
  "sqldatabase1" = {
    name         = "vinodmssqldatabase"
    server_id    = "sql"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"
     
  }
}