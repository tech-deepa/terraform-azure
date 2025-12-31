terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 3.0.2"    // consider 3.0.X  (x:0-9)
    }
  }
  required_version = ">= 1.9.0"  // comparison can be greater than or equal to version
}

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "ap-south-1"
}

resource "azurerm_storage_account" "example" {
  name                     = "storaeaccountname-sample"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}