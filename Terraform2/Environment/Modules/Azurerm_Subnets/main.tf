resource "azurerm_subnet" "sub" {
  for_each             = var.snets
  name                 = each.value.name
  resource_group_name  = each.value.rg
  virtual_network_name = each.value.vnet
  address_prefixes     = each.value.prefix
}
