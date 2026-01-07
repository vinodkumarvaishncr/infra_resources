terraform{
    required_providers{
        azurerm = {
            source = "hashicorp/azurerm"
            version= "~>3.0"
        }

    }
    backend "azurerm" {
        resource_group_name  = "vinod_main_rg"
        storage_account_name = "vinodstoragemain"
        container_name       = "container22"
        key                  = "vinodvm.tfstate"
    }
}

provider "azurerm"{
    features{}
    subscription_id = "98473d5b-c639-404e-9bf2-91559fe65ff8"
}