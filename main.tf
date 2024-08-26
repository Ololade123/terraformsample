terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
features {
  
}
}
resource "azurerm_resource_group" "test" {
  name = "terratest"
  location = "uksouth"
}
resource "azurerm_virtual_network" "terranet" {
    name = "network"
    address_space = ["10.0.0/16"]
    location = azurerm_resource_group.test.location
    resource_group_name = azurerm_resource_group.test.name
  
}

resource "azurerm_subnet" "terranetsub" {
    name = "network_sub"
    address_prefixes = ["10.0.2.0/24"]
    resource_group_name = azurerm_resource_group.test.name
    virtual_network_name = azurerm_virtual_network.terranet
}