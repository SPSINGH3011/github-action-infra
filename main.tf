terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.43.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "1a747295-ba1d-4caf-b64b-855098eb49d6"
}


resource "azurerm_resource_group" "rg1" { #Block resource_group
  name     = "action-rg1"                  #Resource group name
  location = "eastus"               #Resource group location
}

#IMPLICIT
resource "azurerm_storage_account" "storage1" {
  name                     = "actionstorageaccountimplicit"
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
