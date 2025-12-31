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