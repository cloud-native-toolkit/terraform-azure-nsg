
output "id" {
    value = azurerm_network_security_group.nsg.id
    description = "ID of the created network security group"
}

output "name" {
    value = azurerm_network_security_group.nsg.name
    description = "Name of the created network security group"
    depends_on = [
      azurerm_network_security_group.nsg
    ]
}
