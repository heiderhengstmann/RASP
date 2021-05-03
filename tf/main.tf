terraform {
  backend "azurerm" {
    resource_group_name  = "storage"
    storage_account_name = "ststudyheider"
    container_name       = "terra"
    key                  = "pocrasp.terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "dev" {
  name     = "pocrasp-dev"
  location = "brazilsouth"
}




resource "azurerm_container_registry" "acr" {
  name                     = "pocraspacr"
  resource_group_name      = azurerm_resource_group.dev.name
  location                 = azurerm_resource_group.dev.location
  sku                      = "Standard"
  admin_enabled            = true
}
