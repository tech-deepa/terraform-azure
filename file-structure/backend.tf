terraform {
  backend "azurerm" {
    access_key = "acess_key_value"
    storage_account_name = "xxyz"
    container_name = "backend:"
    key = "blob_name"

  }
}