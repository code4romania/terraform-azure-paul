terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.21"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
