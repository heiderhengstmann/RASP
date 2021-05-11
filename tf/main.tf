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



resource "azurerm_virtual_network" "example" {
  name                = "${var.prefix}-vnet"
  location            = azurerm_resource_group.dev.location
  resource_group_name = azurerm_resource_group.dev.name
  address_space       = ["192.168.0.0/16"]
}

resource "azurerm_subnet" "example" {
  name                 = "${var.prefix}-subnet"
  resource_group_name  = azurerm_resource_group.dev.name
  address_prefixes     = ["192.168.1.0/24"]
  virtual_network_name = azurerm_virtual_network.example.name
  service_endpoints    = ["Microsoft.Sql"]
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "${var.prefix}-aks"
  location            = azurerm_resource_group.dev.location
  resource_group_name = azurerm_resource_group.dev.name
  dns_prefix          = "${var.dns_prefix}-aks"

  default_node_pool {
    name           = "examplepool"
    node_count     = 2
    vm_size        = "Standard_B2s"
    vnet_subnet_id = azurerm_subnet.example.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "Standard"
  }
}

data "azurerm_public_ip" "example" {
  name                = reverse(split("/", tolist(azurerm_kubernetes_cluster.example.network_profile.0.load_balancer_profile.0.effective_outbound_ips)[0]))[0]
  resource_group_name = azurerm_kubernetes_cluster.example.node_resource_group
}
