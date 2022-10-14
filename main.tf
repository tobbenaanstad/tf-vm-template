# az login --tenant 85173d93-99ef-4dff-9b45-495719659133 --use-device-code  

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.24.0" #nyeste
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id #default nå er tobias sin sandbox. Change in vars.tf
  features {}
  environment = "public"
}


resource "azurerm_resource_group" "syslab_rg" {
  name     = "systemlab-RG"
  location = var.location
}




