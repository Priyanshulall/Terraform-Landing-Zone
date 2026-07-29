terraform {
  required_providers {
    azurerm={
        source = "Hashicorp/azurerm"
        version = "~>4.0"
    }
  }
}
provider "azurerm" {
  features {}
}