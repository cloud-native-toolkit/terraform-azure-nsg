module "nsg" {
  source = "./module"

  name_prefix           = "${var.resource_group_name}-${random_string.cluster_id.result}"
  resource_group_name   = module.resource_group.name
  virtual_network_name  = module.vnet.name
  region                = module.resource_group.region
  subnets               = [module.subnets.names]
 
  acl_rules = [{
    name                = "ssh-inbound"
    priority            = "101"
    access              = "Allow"
    protocol            = "Tcp"
    direction           = "Inbound"
    source_addr         = "*"
    destination_addr    = "*"
    source_ports        = "*"
    destination_ports   = "22"
  }]
}
