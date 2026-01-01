output "nsg_description" {
  value = [for count in azurerm_network_security_group.example : count.description]
}

output "nsg_details" {
  value = azurerm_network_security_group.example[*]
}
