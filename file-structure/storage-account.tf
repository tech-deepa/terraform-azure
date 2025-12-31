resource "azurerm_storage_account" "s_a_n" {
    name = "ashfgjhgfhwbcjw"
    resource_group_name = azurerm_resource_group.resource_group.name
    location = azurerm_resource_group.resource_group.location //implict dependency
    account_tier = "standard"
    account_replication_type = "LRS"

 depends_on = [azurerm_resource_group.resource_group] // explict dependency
}