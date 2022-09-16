locals {
  name = var.name == "" ? "${var.name_prefix}-nsg" : var.name
}

// Create network security group
resource "azurerm_network_security_group" "nsg" {
    name                    = local.name
    resource_group_name     = var.resource_group_name
    location                = var.region

    dynamic "security_rule" {
        for_each = var.acl_rules
        content {
            name                        = security_rule.value.name
            priority                    = security_rule.value.priority
            direction                   = security_rule.value.direction
            access                      = security_rule.value.access
            protocol                    = security_rule.value.protocol
            source_address_prefix       = security_rule.value.source_addr
            destination_address_prefix  = security_rule.value.destination_addr
            source_port_range           = security_rule.value.source_ports
            destination_port_range      = security_rule.value.destination_ports
        }
    }
}

// Associate NSG with subnets
resource "azurerm_subnet_network_security_group_association" "subnet" {
    count = length(var.subnet_ids)

    subnet_id                   = var.subnet_ids[count.index]
    network_security_group_id   = azurerm_network_security_group.nsg.id
}