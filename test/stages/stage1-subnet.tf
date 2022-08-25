module "subnets" {
  source = "github.com/cloud-native-toolkit/terraform-azure-subnets"

  resource_group_name = module.resource_group.name
  region              = var.region
  vnet_name           = module.vnet.name
  ipv4_cidr_blocks    = cidrsubnets(var.vnet_cidr,4,4)
  acl_rules           = []
}
