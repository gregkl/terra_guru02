terraform {
  cloud {
    organization = "gk_guru"

    workspaces {
      name = "TerraCI2"
    }
  }
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
  

}


provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg_guru03"
  location = "West Europe"
}

resource "azurerm_storage_account" "storage" {
  account_replication_type = "GRS"
  account_tier             = "Standard"
  location                 = azurerm_resource_group.rg.location
  name                     = "storageguru01"
  resource_group_name      = azurerm_resource_group.rg.name
}
