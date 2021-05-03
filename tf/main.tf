provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "dev" {
  name     = "pocrasp-dev"
  location = "brasilsouth"
}


module "aks" {
  source              = "Azure/aks/azurerm"
  resource_group_name = azurerm_resource_group.dev.name
  client_id           = "f83cd753-b8ab-41e7-a997-130247259fcf"
  client_secret       = "CFxN.2ucE~AkIQkm5_IFaXYwQWDetLRrT5"
  prefix              = "akspocrasp"
  agents_count        = "3" 
}

resource "azurerm_api_management" "API" {
  name                = "pocraspapim"
  location            = azurerm_resource_group.dev.location
  resource_group_name = azurerm_resource_group.dev.name
  publisher_name      = "POC API TF"
  publisher_email     = "heider.hengstmann@gft.com"

  sku_name = "Developer_1"
}

resource "azurerm_container_registry" "acr" {
  name                     = "pocraspacr"
  resource_group_name      = azurerm_resource_group.dev.name
  location                 = azurerm_resource_group.dev.location
  sku                      = "Standard"
  admin_enabled            = true
}
