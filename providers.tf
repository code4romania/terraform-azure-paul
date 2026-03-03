terraform {
  required_version = "~> 1.13"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.60"
    }
  }

  cloud {
    organization = "onghub"

    workspaces {
      tags = [
        "paul",
        "azure",
      ]
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
