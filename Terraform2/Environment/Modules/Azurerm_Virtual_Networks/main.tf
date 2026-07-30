resource "azurerm_virtual_network" "Vnets" {
  for_each            = var.virtuals
  name                = each.value.name
  resource_group_name = each.value.rg
  location            = each.value.loc
  address_space       = each.value.addr_space
}
