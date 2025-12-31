terraform {
  required_providers {
    source = "hashicorp/azurerm"
    version = "~>3.0.9"
  }
  required_version = ">=4.0.9"
}

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "rg1" {
  name = "rg1"
  location = "ap-south-1"
}

variable environment{
    type = string
    description = "This specify the environment"
    default = "staging"
}

locals {
  comman_tags = {
    environment = "dev"
    stage = "alpha"
  }
}

resource "azurerm_storage_account" "storage_account" {
    name = "azurestorageaccount 123345"
    resource_group_name = azurerm_resource_group.rg1.name
    location = azurerm_resource_group.rg1.location
    account_tier = "Standard"
    account_replication_type = "LRS"
    
    tags = {
        environment = local.comman_tags.environment
    }

}

output "storage_account" {
  value = azurerm_storage_account.storage_account.name
}