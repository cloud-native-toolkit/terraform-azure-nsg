
variable "name_prefix" {
    type = string
    description = "Prefix for the NSG name (\"<prefix>-nsg\")"
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group into which to deploy the NSG"
}

variable "region" {
    type = string
    description = "Azure region containing the virtual network"
}

variable "virtual_network_name" {
    type = string
    description = "VNet into which to deploy the NSG"
}

variable "subnets" {
    type = list(string)
    description = "List of subnet ids to associate with NSG"
    default = []
}

variable "acl_rules" {
  type = list(object({
    name                = string
    priority            = string 
    direction           = string   // Inbound or Outbound
    access              = string   // Allow or Deny
    protocol            = string   // Tcp, Udp or UCMP
    source_addr         = string
    destination_addr    = string
    source_ports        = string
    destination_ports   = string
  }))
  description = "List of rules to set on the subnet access control list"
  default = []
}