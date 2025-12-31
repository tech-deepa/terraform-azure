terraform {
  required_providers {
    source = "hashicorp/azurerm"
    version = "~>3.0.4"
  }

  backend "azurerm" {
    access_key           = "abcdefghijklmnopqrstuvwxyz0123456789..."  # Can also be set via `ARM_ACCESS_KEY` environment variable.
    storage_account_name = "abcd1234"                                 # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                                  # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev.terraform.tfstate"                   # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }

  required_version = ">=9.0.1"
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
  name                     = "storaeaccountname-sample30122025"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}